#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

mysqld_safe --skip-grant-tables &

cd /home/jovyan/jupyter_edu_data
git reset --hard
git pull
cd /home/jovyan

if [[ ! -z "${JUPYTERHUB_API_TOKEN}" ]]; then
  # launched by JupyterHub, use single-user entrypoint
  exec /usr/local/bin/start-singleuser.sh $*
else
  if [[ ! -z "${JUPYTER_ENABLE_LAB}" ]]; then
    . /usr/local/bin/start.sh jupyter lab --NotebookApp.token='' $*
  else
    . /usr/local/bin/start.sh jupyter notebook --NotebookApp.token='' $*
  fi
fi
