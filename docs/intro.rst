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

  ['[1] Jacobs, K. 2019. This is a test title. In Proceedings of Some Journal.']

In the code, the RefXtract model is initialized and the model parameters are downloaded from the internet. Then,
the model is executed on an example text. It returns a list of the found references in the text.

Extracting titles
-----------------

In order to extract titles from references, the following code is used:

.. code-block:: python

   from citextract.models.titlextract import TitleXtractor

   titlextractor = TitleXtractor().load()
   ref = """[1] Jacobs, K. 2019. This is a test title. In Proceedings of Some Journal."""
   title = titlextractor(ref)
   print(title)

This might produce the following output:

.. code-block:: python

  'This is a test title.'

In the code, the TitleXtract model is initialized and the model parameters are downloaded from the internet. Then,
the model is executed on an example text. It returns a string of the found title in the reference.

Converting arXiv PDF to text
----------------------------

In order to get content for the RefXtract model, one can download a PDF from arXiv by using the following code:

.. code-block:: python

   from citextract.utils.pdf import convert_pdf_url_to_text

   pdf_url = 'https://arxiv.org/pdf/some_file.pdf'
   text = convert_pdf_url_to_text(pdf_url)

Further reading
---------------

The module documentation contains pointers to the different classes and methods that can be used.

.. toctree::
   :maxdepth: 4

   citextract