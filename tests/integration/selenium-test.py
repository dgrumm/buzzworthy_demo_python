from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.remote.remote_connection import RemoteConnection
                     
command_executor = RemoteConnection("http://buzz-selenium.gr.calculi.io/wd/hub", resolve_ip=False)
driver = webdriver.Remote(
   command_executor,
   desired_capabilities={
            "browserName": "chrome",
            "browserVersion": "latest",
            "platform": "LINUX",
            "platformName": "linux",
        })
#print ("Video: " + VIDEO_URL + driver.session_id)
  
try:
    driver.implicitly_wait(30)
    #driver.maximize_window() # Note: driver.maximize_window does not work on Linux selenium version v2, instead set window size and window position like driver.set_window_position(0,0) and driver.set_window_size(1920,1080)
    driver.set_window_position(0,0)
    driver.set_window_size(1920,1080)
    driver.get("http://buzz-integration.gr.calculi.io")
    assert "Python" in driver.title
    elem = driver.find_element_by_name("q")
    elem.send_keys("documentation")
    elem.send_keys(Keys.RETURN)
    assert "No results found." not in driver.page_source
finally:
    driver.quit()
