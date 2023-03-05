# export PATH=$PATH:~/.local/bin
# echo $PATH

# Airflow needs a home. `~/airflow` is the default, but you can put it
# somewhere else if you prefer (optional)
# export AIRFLOW_HOME=~/.local/airflow
export AIRFLOW_HOME=/workspaces/airflow_dev_container/airflow

pip install --upgrade pip

# Install Airflow using the constraints file
AIRFLOW_VERSION=2.5.1
PYTHON_VERSION="$(python --version | cut -d " " -f 2 | cut -d "." -f 1-2)"
# For example: 3.7
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
# For example: https://raw.githubusercontent.com/apache/airflow/constraints-2.5.1/constraints-3.7.txt
pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"



echo "********************"
echo "* some system set up, like symlinks"

# set -x

# ln -s ~/airflow airflow

# cd airflow

# ln -s /workspaces/airflow_dev_container/dags dags
# cd /workspaces/airflow_dev_container/

# ln -s ~/airflow/data data
# ln -s ~/airflow/logs logs

# echo $(pwd)

# ln -s /workspaces/airflow_dev_container/dags ~/airflow/dags
# ln -s /workspaces/airflow_dev_container/data ~/airflow/data
# ln -s /workspaces/airflow_dev_container/dags ~/airflow/dags
# ln -s /workspaces/airflow_dev_container/data ~/airflow/data

#ln -s /workspaces/airflow_dev_container/logs ~/airflow/logs

# set +x

echo "Login with username: admin  password: " $(cat airflow/standalone_admin_password.txt)

# The Standalone command will initialise the database, make a user,
# and start all components for you.
# airflow standalone

# Visit localhost:8080 in the browser and use the admin account details
# shown on the terminal to login.
# Enable the example_bash_operator dag in the home page