#!/bin/bash

set -e

# Wait for PG
while ! pg_isready -q -d $POSTGRES_DB -U $POSTGRES_USER; do
    sleep 2
done

# Create Table
psql -v ON_ERROR_STOP=1 --username = "$POSTGRES_USER" --dbname ="$POSTGRES_DB" <<-EOSQL
    CREATE TABLE IF NOT EXISTS complaints (
        date_received text,
        product text,
        sub_product text,
        issue text,
        sub_issue text,
        consumer_complaint_narrative text,
        company_public_response text,
        company text,
        state text,
        zip_code text,
        tags text,
        consumer_consent_provided text,
        submitted_via text,
        date_sent_to_company text,
        company_response_to_consumer text,
        timely_response text,
        consumer_disputed text,
        complaint_id text
    );;
EOSQL

#Import data 
psql -v ON_ERROR_STOP=1 --username = "$POSTGRES_USER" --dbname ="$POSTGRES_DB" <<-EOSQL
    \copy complaints FROM '/data/complaints.csv' CSV HEADER;
EOSQL