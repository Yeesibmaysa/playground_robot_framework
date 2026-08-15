"""Test configuration and public demo credentials for SauceDemo."""

import os

BASE_URL = "https://www.saucedemo.com/"
BROWSER = "chrome"
HEADLESS = os.getenv("HEADLESS", "false").lower() == "true"
USERNAME = "standard_user"
PASSWORD = "secret_sauce"
INVALID_USERNAME = "helloworld"
INVALID_PASSWORD = "1234567890"
