# CiteXtract

[![Read the Docs](https://img.shields.io/readthedocs/citextract.svg)](https://citextract.readthedocs.io/en/latest/)
[![CircleCI](https://img.shields.io/circleci/build/github/kmjjacobs/citextract/master.svg)](https://circleci.com/gh/kmjjacobs/citextract/tree/master)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/kmjjacobs/citextract.svg)](https://cloud.docker.com/repository/docker/kmjjacobs/citextract)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/citextract.svg)](https://img.shields.io/pypi/pyversions/citextract.svg)

[CiteXtract](https://www.citextract.com/) - Bringing structure to the papers on ArXiv.

## Getting started

In order to install CiteXtract, run the following command:

```bash
pip install citextract
```

### Extracting references

Then, one can extract references from a text using the RefXtract model:

```python
from citextract.models.refxtract import RefXtractor

refxtractor = RefXtractor().load()
text = """This is a test sentence.\n[1] Jacobs, K. 2019. This is a test title. In Proceedings of Some Journal."""
refs = refxtractor(text)
print(refs)
```

It gives the following output:

```python
['[1] Jacobs, K. 2019. This is a test title. In Proceedings of Some Journal.']
```

Under the hood, a trained neural network extracts reference boundaries and extracts the references by using these boundaries.

### Extracting titles

Using the found references, titles can be extracted by using the TitleXtract model:

```python
from citextract.models.titlextract import TitleXtractor

titlextractor = TitleXtractor().load()
ref = """[1] Jacobs, K. 2019. This is a test title. In Proceedings of Some Journal."""
title = titlextractor(ref)
print(title)
```

It gives the following output:

```python
'This is a test title.'
```

Here, a trained neural network extracts the titles from the given reference.

### Converting an arXiv PDF to text

There is a utility available which takes an arXiv URL and converts it to text:

```python
from citextract.utils.pdf import convert_pdf_url_to_text

pdf_url = 'https://arxiv.org/pdf/some_file.pdf'
text = convert_pdf_url_to_text(pdf_url)
print(text)
```