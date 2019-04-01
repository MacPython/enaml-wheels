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
        apt-get -qq update
        apt-get install -y matchbox-window-manager xterm libxkbcommon-x11-0
        export DISPLAY=:99.0
        /sbin/start-stop-daemon --start --quiet --pidfile /tmp/custom_xvfb_99.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :99 -screen 0 1400x900x24 -ac +extension GLX +render
        matchbox-window-manager&
        sleep 5
        pip install pyqt5 pytest-qt pytest-xvfb;
    fi
    python --version
    py.test ../enaml/tests
}
