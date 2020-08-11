setup:
	# Create python virtualenv & source it
	# source ~/.udacity-devops/bin/activate
	python3 -m venv capstone
	source ~/capstone/bin/activate

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
	pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	# python -m pytest -vv --cov=myrepolib tests/*.py
	# python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is linter for html
	tidy -q -e ../templates/index.html
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 app.py

all: install lint test