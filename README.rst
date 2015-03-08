=================
generic-templater
=================

Formula to generate files from pillar using the given jinja templates. Can be used to generate pillar from pillar.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``generic-templater``
--------

TODO: Description

Example
=======

1. Define templates in pillar.generic_templater.templates

2. Place all needed jinja templates (defined in pillar.generic_templater.templates.<template-name>.filelist) in a directory 'generic-templater' in file_roots. Templates can access pillar data from pillar.generic_templater.<template-name> in var 'config'.

3. Create instances in pillar.generic_templater.<template-name>

See *generic-templater/pillar.example*.
