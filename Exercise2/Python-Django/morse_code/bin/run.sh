#/bin/bash
PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../";
cd $PROJECT_PATH;

command -v python >/dev/null 2>&1 || {
    echo "I require python but it's not installed.  Aborting." >&2;
    exit 1;
};

command -v pip >/dev/null 2>&1 || {
    wget -P /tmp/ https://bootstrap.pypa.io/get-pip.py;
    python /tmp/get-pip.py;
};

command -v virtualenv >/dev/null 2>&1 || {
    sudo pip install virtualenv;
};

virtualenv venv;
source venv/bin/activate;

pip install -r requirements.txt;
cp morse_code/settings/local.dev.py morse_code/settings/local.py;

python manage.py syncdb --all --noinput;
python manage.py runserver;
