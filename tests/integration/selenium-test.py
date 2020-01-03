from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.remote.remote_connection import RemoteConnection
                     
command_executor = RemoteConnection("<%= p('buzz.selenium_url') %>", resolve_ip=False)
driver = webdriver.Remote(
   command_executor,
   desired_capabilities=DesiredCapabilities.FIREFOX
)

print(driver)
  
try:
    driver.implicitly_wait(30)
    driver.set_window_position(0,0)
    driver.set_window_size(1920,1080)
    driver.get("<%= p('buzz.app_url') %>")
    assert "<%= p('buzz.title') %>" in driver.title
    content = driver.find_element_by_class_name('<%= p('buzz.class') %>')
    print(content)
    assert content != ""
    assert "No results found." not in driver.page_source
finally:
    driver.quit()
