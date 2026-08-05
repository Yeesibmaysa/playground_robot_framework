"""Test configuration and public demo credentials for SauceDemo."""

import os

BASE_URL = "https://www.saucedemo.com/"
BROWSER = "chrome"
HEADLESS = os.getenv("HEADLESS", "false").lower() == "true"
VALID_USERNAME = "standard_user"
VALID_PASSWORD = "secret_sauce"
