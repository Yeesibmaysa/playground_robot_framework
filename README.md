# playground_robot_framework

Starter project for experimenting with [Robot Framework](https://robotframework.org/).

## Requirements

- Python 3.10 or newer

## Setup

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
```

## Run tests

```bash
robot --outputdir results tests
```

Run the SauceDemo login test:

```bash
robot --outputdir results tests/login.robot
```

Run without displaying the browser (useful for CI):

```bash
HEADLESS=true robot --outputdir results tests/login.robot
```

Run only smoke tests:

```bash
robot --outputdir results --include smoke tests
```

Reports are written to `results/` and are intentionally excluded from Git.

## Project structure

```text
tests/       Test suites
resources/   Shared keywords and page objects
variables/   Shared variable files
results/     Generated test reports (ignored)
```
