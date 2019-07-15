Getting started
===============

Installation
------------

The installation of CiteXtract is done by the following command:

.. code-block:: bash

   pip install citextract

CiteXtract is automatically tested on Python 3.5 or newer.

Extracting references
---------------------

In order to extract references, the following code is used:

.. code-block:: python
   from citextract.models.refxtract import RefXtractor

   refxtractor = RefXtractor().load()
   text = """This is a test sentence.\n[1] Jacobs, K. 2019. This is a test title. In Proceedings of Some Journal."""
   refs = refxtractor(text)
   print(refs)

This might produce the following output:

.. code-block:: python
  ['[1] Jacobs, K. 2019. This is a test title. In Proceedings of Some Journal']

In the code, the RefXtractor model is initialized and the model parameters are downloaded from the internet. Then,
the model is executed on an example text.