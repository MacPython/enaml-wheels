# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    :
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    pip install pytest
    if [ $MB_PYTHON_VERSION -gt 3.4 ]; then
        pip install pyqt5=5.9 pytest-qt;
    fi
    python --version
    py.test ../enaml/tests
}
