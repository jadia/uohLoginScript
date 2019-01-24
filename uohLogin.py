#!/usr/bin/python3

import time
from selenium.webdriver.common.keys import Keys
from selenium import webdriver

#------ Edit the following ------#
myRollno = "17mcmi02"
myPass = "cnf2017"
#-------------------------------#

browser = webdriver.Chrome()
browser.get("https://192.168.56.2:8090/httpclient.html")
time.sleep(2)
username = browser.find_element_by_id("username")
password = browser.find_element_by_id("password")
username.send_keys(myRollno)
password.send_keys(myPass)
login_attempt = browser.find_element_by_id("loginbutton").click()
time.sleep(1)
browser.quit()
