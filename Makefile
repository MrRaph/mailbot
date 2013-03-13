.PHONY: docs test clean

bin/python:
	virtualenv . --python python2
	bin/python setup.py develop

test: bin/python
	bin/pip install tox
	bin/tox

docs:
	bin/pip install sphinx
	SPHINXBUILD=../bin/sphinx-build $(MAKE) -C docs html $^

clean:
	rm -rf bin .tox include/ lib/ man/ mailbot.egg-info/ build/
