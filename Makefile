docker-build:
	docker-compose build citextract
docker-push: docker-build
	docker login --username kmjjacobs
	docker push kmjjacobs/citextract
check:
	flake8
	find . -iname "*.py" ! -wholename "*.git*" ! -wholename "*test_data*" ! -wholename "*tests*" ! -wholename "*sandbox*" ! -wholename "*build*" ! -wholename "*docs*" | xargs pylint
	pydocstyle --convention=numpy --match-dir "^(?!migrations|node_modules|\.git|test_data|tests|sandbox|docs|build).*"
	python -m pytest tests
pypi-build:
	python setup.py sdist bdist_wheel
pypi-upload-test: pypi-build
	python -m twine upload --skip-existing --repository-url https://test.pypi.org/legacy/ dist/*
pypi-upload: pypi-build
	python -m twine upload --skip-existing dist/*
docs-html:
	sphinx-apidoc -f -o docs . setup.py tests sandbox && cd docs && make html