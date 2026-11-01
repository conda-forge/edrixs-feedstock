#!/usr/bin/env bash
set -euxo pipefail

CONDA_PREFIX="${PREFIX}" "${PYTHON}" -m pip install . --no-deps --no-build-isolation --ignore-installed -vvv
