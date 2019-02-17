#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

cd /home/jovyan/jupyter_edu_data
git reset --hard
git pull
cd /home/jovyan

mysqld_safe --skip-grant-tables &

tini -g -- "$@"
