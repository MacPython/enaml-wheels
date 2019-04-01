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
    if [ ${MB_PYTHON_VERSION:0:1} -gt 2 ] && [ ${MB_PYTHON_VERSION:2:3} -gt 5 ]; then
        if [ -z "$IS_OSX" ]; then  # Running on Linux
            sudo apt-get -qq update
            sudo apt-get install -y matchbox-window-manager xterm libxkbcommon-x11-0
            matchbox-window-manager&
            sleep 5
            pip install pytest-xvfb;
        fi
        pip install pyqt5 pytest-qt;
    fi
    python --version
    py.test ../enaml/tests
}
