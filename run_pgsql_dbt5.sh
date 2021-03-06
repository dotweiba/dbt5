#!/bin/bash

basedir=`pwd`

sudo apt update
sudo apt install -y build-essential autoconf cmake r-base bc sysstat ghostscript
sudo apt install -y postgresql-server-dev-all libpqxx-dev postgresql libpq-dev

# Installing DBTtools
cd $basedir/.. && git clone https://github.com/mw2q/dbttools
cd dbttools && cmake CMakeLists.txt && sudo make install DESTDIR=/usr/local

# Building & installing DBT5
cd $basedir && cmake CMakeLists.txt -DDBMS=pgsql
cd $basedir/egen/prj && make -f Makefile.pgsql
cd $basedir/storedproc/pgsql/c && make && sudo make install
cd $basedir && make && sudo make install

# Copying to /opt/dbt5
sudo cp -R $basedir/../dbt5/ /opt/
sudo chown -R postgres:postgres /opt/dbt5

# Building DB
sudo -u postgres /bin/bash -c "source /opt/dbt5/dbt5_pgsql_profile && dbt5-pgsql-build-db -c 5000 -t 5000 -s 500 -w 1"

# Running Workload
sudo -u postgres /bin/bash -c "source /opt/dbt5/dbt5_pgsql_profile && rm -rf /tmp/results_dbt5 && dbt5-run-workload -a pgsql -f 1 -o /tmp/results_dbt5 -n dbt5 -c 1000 -t 10000 -u 5 -d 100 -w 100"

