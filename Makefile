docker-build:
	docker-compose build citextract
docker-push: docker-build
	docker login --username kmjjacobs
	docker push kmjjacobs/citextract
check:
	flake8
	find . -iname "*.py" ! -wholename "*node_modules*" ! -wholename "*migrations*" ! -wholename "*.git*" ! -wholename "*test_data*" ! -wholename "*tests*" ! -wholename "*sandbox*" ! -wholename "*build*" ! -wholename "*docs*" | xargs pylint
	pydocstyle --convention=numpy --match-dir "^(?!migrations|node_modules|\.git|test_data|tests|sandbox|docs|build).*"
pypi-build:
	python setup.py sdist bdist_wheel
pypi-upload-test: dist
	python -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*
pypi-upload: dist
	python -m twine upload dist/*