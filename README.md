## Buzzworthy-Demo-Python

This is a working application that can be used to demonstrate how to build, test, deploy and verify a complete CI/CD pipeline using Guide-Rails®

Buzzworthy-Demo-Python is simple web application using Python and Flask.

__Credit:__ This application is shamelessly borrowed and adapted from Rob van der Leek's [cicd-buzz](https://github.com/robvanderleek/cicd-buzz).

__Important:__
 * You do *not* need to know Python to follow this tutorial
 * You will *not* need to setup a local Python environment if you don't want to - you can build, test, deploy and verify the demo application via the Guide-Rails® UI or editing configuration and pushing to your Git repository


### Local Setup
#### Install Python

   There are a number of online guides for installing and/or upgrading Python on your system at https://www.python.org/. For this tutorial you need Python 2.7 or later

```
$ python --version
Python 2.7.10
```

#### Install Virtualenv
```
$ pip install virtualenv
```

#### Create and activate virtual environment
```
$ virtualenv venv
$ source venv/bin/activate
```

#### Install dependencies
The tutorial application uses `pytest`for unit testing and `flask` web application framework. Required versions of these dependencies are in the `requirements.txt` file.
```
(venv) $ pip install -r requirements.txt
```

#### Run your (unit) tests
```
(venv) $ python -m pytest -v tests/test_generator.py
=========================================================== test session starts ============================================================
platform darwin -- Python 2.7.10, pytest-3.0.6, py-1.8.0, pluggy-0.4.0 -- /Users/foo/buzzworthy-demo-python/venv/bin/python
cachedir: .cache
rootdir: /Users/foo/buzzworthy-demo-python, inifile:
collected 3 items

tests/test_generator.py::test_sample_single_word PASSED
tests/test_generator.py::test_sample_multiple_words PASSED
tests/test_generator.py::test_generate_buzz_of_at_least_five_words PASSED

========================================================= 3 passed in 0.02 seconds =========================================================
```
#### Run you webapp
```
(venv) $ python webapp.py
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
```

### Define your pipeline in Guide-Rails®
#### Configure your `build` segment(s)
#### Configure your `deploy-and-test` segment(s)
#### Configure your `production` segment(s)
