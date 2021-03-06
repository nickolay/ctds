Getting Started
===============

`cTDS` is built on top of `FreeTDS`_ and therefore is required to use `cTDS`.

Installing FreeTDS
------------------

It is **highly** recommended to use the latest stable version of `FreeTDS`_, if
possible. If this is not possible, `FreeTDS`_ can be installed using your
system's package manager.

.. warning::

    Versions of `FreeTDS`_ prior to *0.95* contain defects which may
    affect `cTDS` functionality.


Installation From Source
^^^^^^^^^^^^^^^^^^^^^^^^

`FreeTDS`_ can be easily built from the latest stable source for use in a
`virtualenv`_ using the following:

.. code-block:: bash

    # Create the virtual environment.
    virtualenv ctds-venv && cd ctds-venv
    wget 'http://www.freetds.org/files/stable/freetds-patched.tar.gz'
    tar -xzf freetds-patched.tar.gz
    pushd freetds-*
    ./configure --prefix "$(dirname $(pwd))" && make && make install
    popd


Installation On Debian-based Systems
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Both *FreeTDS* and the *Python* development headers can easily be installed
using the system package manager on Debian-based systems, such as Ubuntu.

.. code-block:: bash

    sudo apt-get install freetds-dev python-dev


Installation On Mac OS X
^^^^^^^^^^^^^^^^^^^^^^^^

On OS X, `homebrew`_ is recommended for installing `FreeTDS`_.

.. code-block:: bash

    brew update
    brew install freetds


Installation On Windows
^^^^^^^^^^^^^^^^^^^^^^^

On Windows, `FreeTDS`_ should be installed from the latest source code.
A powershell script is include which may aid in this:

.. code-block:: powershell

    ./windows/freetds-install.ps1
    # FreeTDS headers and include files are installed to ./build/include
    # and ./build/lib


PIP Installation
----------------

Once `FreeTDS`_ is installed, *cTDS* can be installed using `pip`_.

When using a non-system version of `FreeTDS`_, use the following to specify
which `include` and `library` directories to compile and link *cTDS* against.

.. code-block:: bash

    # Assuming . is the root of the virtualenv.
    # Note: In order to load the locally built version of the
    # FreeTDS libraries either the working directory must be
    # the same as when ctds was installed or LD_LIBRARY_PATH
    # must be set correctly.
    pip install --global-option=build_ext \
        --global-option="--include-dirs=$(pwd)/include" \
        --global-option=build_ext \
        --global-option="--library-dirs=$(pwd)/lib" \
        --global-option=build_ext --global-option="--rpath=./lib" \
        ctds

    # Alternatively, use the CTDS-specifc environment variables to
    # specify the include and library directories:
    CTDS_INCLUDE_DIRS=$(pwd)/include \
        CTDS_LIBRARY_DIRS=$(pwd)/lib \
        CTDS_RUNTIME_LIBRARY_DIRS=$(pwd)/lib \
        pip install ctds


When using the system version of `FreeTDS`_, use the following:

.. code-block:: bash

    pip install ctds


.. _FreeTDS: http://www.freetds.org
.. _homebrew: http://brew.sh/
.. _pip: https://pip.pypa.io/en/stable/
.. _virtualenv: http://virtualenv.readthedocs.org/en/latest/userguide.html
