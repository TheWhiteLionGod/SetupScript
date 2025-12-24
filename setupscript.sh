#!/bin/bash
# Creating Git Repo
git init

# Create Source Dir
mkdir src

# Create Test Dir
mkdir test

# Creating Virtual Environment
python3 -m venv env
source env/bin/activate
PYTHON=env/bin/python

# Installing Pytest, Pytest-Cov, Flake8
$PYTHON -m pip install pytest pytest-cov flake8

# Creating Pytest.Ini
cat << EOF > pytest.ini
[pytest]
testpaths = src/test
python_files = test_*.py *_test.py
python_classes = Test*
python_functions = test_*
pythonpath = src
EOF

# Creating PyProject.TOML
cat << EOF > pyproject.toml
name: {PROJECT_NAME}
version: 0.0.1
EOF

# Creating ReadMe.MD
cat << EOF > README.md
# {PROJECT_NAME}
## Installation
[text]

## Usage
[text]

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
EOF

# Creating LICENSE
cat << EOF > LICENSE
MIT License

Copyright (c) {year} {fullname}

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

# Create Gitignore
cat << EOF >> .gitignore
# Virtual Environment
env/

# Caching
.pytest_cache/
__pycache__/
*.py[cod]
*.egg-info
.coverage

# Setup Script
setupscript.sh
EOF

# Create Inital Commit
git add .
git commit -m "inital commit"

