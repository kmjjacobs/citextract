"""Setup script for the CiteXtract project."""

import setuptools

import citextract

with open("README.md", "r") as fh:
    LONG_DESCRIPTION = fh.read()

setuptools.setup(
    name=citextract.name,
    version=citextract.__version__,
    author=citextract.author,
    author_email=citextract.author_email,
    description=citextract.description,
    long_description=LONG_DESCRIPTION,
    long_description_content_type="text/markdown",
    url=citextract.url,
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
