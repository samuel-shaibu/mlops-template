install:
	pip	install	--upgrade pip &&\
		pip install	-r	requirements.txt

test:
	python -m 	pytest	-v	--cov=main --cov=calCLI --cov=mylib test_*.py

format:
	black	*.py mylib/*.py

lint:
	pylint	--disable=R,C  --extension-pkg-whitelist='pydantic' main.py --ignore-patterns=test_.*?py *.py mylib/*.py

container: 	format lint

deploy:
	#deploy goes here

all: install test lint format deploy