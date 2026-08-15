"""Test configuration and public demo credentials for SauceDemo."""

import os

BASE_URL = "https://www.saucedemo.com/"
BROWSER = "chrome"
HEADLESS = os.getenv("HEADLESS", "false").lower() == "true"
USERNAME = "standard_user"
PASSWORD = "secret_sauce"
INVALID_USERNAME = "helloworld"
INVALID_PASSWORD = "1234567890"
CUSTOMER_FIRST_NAME = "Yeesibmaysa"
CUSTOMER_LAST_NAME = "Tester"
CUSTOMER_POSTAL_CODE = "10110"
