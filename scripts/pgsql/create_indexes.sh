#!/bin/sh

#
# This file is released under the terms of the Artistic License.
# Please see the file LICENSE, included in this package, for details.
#
# Copyright (C) 2002 Mark Wong & Open Source Development Lab, Inc.
#
# 2006 Rilson Nascimento
# based on TPC-Benchmark E Specification, Revision 0.32

DIR=`dirname $0`
. ${DIR}/pgsql_profile || exit 1

USE_TABLESPACES=0
while getopts "t" OPT; do
	case ${OPT} in
	t)
		USE_TABLESPACES=1
		;;
	esac
done

if [ ${USE_TABLESPACES} -eq 1 ]; then
	TS_PK_ACCOUNT_PERMISSION="${TSDIR}/pk_account_permission/ts"
	TS_FK_ACCOUNT_PERMISSION="${TSDIR}/fk_account_permission/ts"
	TS_PK_CUSTOMER="${TSDIR}/pk_customer/ts"
	TS_FK_CUSTOMER="${TSDIR}/fk_customer/ts"
	TS_PK_CUSTOMER_ACCOUNT="${TSDIR}/pk_customer_account/ts"
	TS_FK_CUSTOMER_ACCOUNT="${TSDIR}/fk_customer_account/ts"
	TS_PK_CUSTOMER_TAXRATE="${TSDIR}/pk_customer_taxrate/ts"
	TS_FK_CUSTOMER_TAXRATE="${TSDIR}/fk_customer_taxrate/ts"
	TS_PK_HOLDING="${TSDIR}/pk_holding/ts"
	TS_FK_HOLDING="${TSDIR}/fk_holding/ts"
	TS_PK_HOLDING_HISTORY="${TSDIR}/pk_holding_history/ts"
	TS_FK_HOLDING_HISTORY="${TSDIR}/fk_holding_history/ts"
	TS_PK_HOLDING_SUMMARY="${TSDIR}/pk_holding_summary/ts"
	TS_FK_HOLDING_SUMMARY="${TSDIR}/fk_holding_summary/ts"
	TS_PK_WATCH_ITEM="${TSDIR}/pk_watch_item/ts"
	TS_FK_WATCH_ITEM="${TSDIR}/fk_watch_item/ts"
	TS_PK_WATCH_LIST="${TSDIR}/pk_watch_list/ts"
	TS_FK_WATCH_LIST="${TSDIR}/fk_watch_list/ts"
	TS_PK_BROKER="${TSDIR}/pk_broker/ts"
	TS_FK_BROKER="${TSDIR}/fk_broker/ts"
	TS_PK_CASH_TRANSACTION="${TSDIR}/pk_cash_transaction/ts"
	TS_FK_CASH_TRANSACTION="${TSDIR}/fk_cash_transaction/ts"
	TS_PK_CHARGE="${TSDIR}/pk_charge/ts"
	TS_FK_CHARGE="${TSDIR}/fk_charge/ts"
	TS_PK_COMMISSION_RATE="${TSDIR}/pk_commission_rate/ts"
	TS_FK_COMMISSION_RATE="${TSDIR}/fk_commission_rate/ts"
	TS_PK_SETTLEMENT="${TSDIR}/pk_settlement/ts"
	TS_FK_SETTLEMENT="${TSDIR}/fk_settlement/ts"
	TS_PK_TRADE="${TSDIR}/pk_trade/ts"
	TS_FK_TRADE="${TSDIR}/fk_trade/ts"
	TS_PK_TRADE_HISTORY="${TSDIR}/pk_trade_history/ts"
	TS_FK_TRADE_HISTORY="${TSDIR}/fk_trade_history/ts"
	TS_PK_TRADE_REQUEST="${TSDIR}/pk_trade_request/ts"
	TS_FK_TRADE_REQUEST="${TSDIR}/fk_trade_request/ts"
	TS_PK_TRADE_TYPE="${TSDIR}/pk_trade_type/ts"
	TS_PK_COMPANY="${TSDIR}/pk_company/ts"
	TS_FK_COMPANY="${TSDIR}/fk_company/ts"
	TS_PK_COMPANY_COMPETITOR="${TSDIR}/pk_company_competitor/ts"
	TS_FK_COMPANY_COMPETITOR="${TSDIR}/fk_company_competitor/ts"
	TS_PK_DAILY_MARKET="${TSDIR}/pk_daily_market/ts"
	TS_FK_DAILY_MARKET="${TSDIR}/fk_daily_market/ts"
	TS_PK_EXCHANGE="${TSDIR}/pk_exchange/ts"
	TS_FK_EXCHANGE="${TSDIR}/fk_exchange/ts"
	TS_PK_FINANCIAL="${TSDIR}/pk_financial/ts"
	TS_FK_FINANCIAL="${TSDIR}/fk_financial/ts"
	TS_PK_INDUSTRY="${TSDIR}/pk_industry/ts"
	TS_FK_INDUSTRY="${TSDIR}/fk_industry/ts"
	TS_PK_LAST_TRADE="${TSDIR}/pk_last_trade/ts"
	TS_FK_LAST_TRADE="${TSDIR}/fk_last_trade/ts"
	TS_PK_NEWS_ITEM="${TSDIR}/pk_news_item/ts"
	TS_PK_NEWS_XREF="${TSDIR}/pk_news_xref/ts"
	TS_FK_NEWS_XREF="${TSDIR}/fk_news_xref/ts"
	TS_PK_SECTOR="${TSDIR}/pk_sector/ts"
	TS_PK_SECURITY="${TSDIR}/pk_security/ts"
	TS_FK_SECURITY="${TSDIR}/fk_security/ts"
	TS_PK_ADDRESS="${TSDIR}/pk_address/ts"
	TS_FK_ADDRESS="${TSDIR}/fk_address/ts"
	TS_PK_STATUS_TYPE="${TSDIR}/pk_status_type/ts"
	TS_PK_TAXRATE="${TSDIR}/pk_taxrate/ts"
	TS_PK_ZIP_CODE="${TSDIR}/pk_zip_code/ts"

	#
	# Creating 'ts' subdirectories because PostgreSQL doesn't like that
	# 'lost+found' directory if a device was mounted at
	# '${TSDIR}/warehouse'.
	#
	mkdir -p ${TS_PK_ACCOUNT_PERMISSION_DIR} || exit 1
	mkdir -p ${TS_FK_ACCOUNT_PERMISSION_DIR} || exit 1
	mkdir -p ${TS_PK_CUSTOMER_DIR} || exit 1
	mkdir -p ${TS_FK_CUSTOMER_DIR} || exit 1
	mkdir -p ${TS_PK_CUSTOMER_ACCOUNT_DIR} || exit 1
	mkdir -p ${TS_FK_CUSTOMER_ACCOUNT_DIR} || exit 1
	mkdir -p ${TS_PK_CUSTOMER_TAXRATE_DIR} || exit 1
	mkdir -p ${TS_FK_CUSTOMER_TAXRATE_DIR} || exit 1
	mkdir -p ${TS_PK_HOLDING_DIR} || exit 1
	mkdir -p ${TS_FK_HOLDING_DIR} || exit 1
	mkdir -p ${TS_PK_HOLDING_HISTORY_DIR} || exit 1
	mkdir -p ${TS_FK_HOLDING_HISTORY_DIR} || exit 1
	mkdir -p ${TS_PK_HOLDING_SUMMARY_DIR} || exit 1
	mkdir -p ${TS_FK_HOLDING_SUMMARY_DIR} || exit 1
	mkdir -p ${TS_PK_WATCH_ITEM_DIR} || exit 1
	mkdir -p ${TS_FK_WATCH_ITEM_DIR} || exit 1
	mkdir -p ${TS_PK_WATCH_LIST_DIR} || exit 1
	mkdir -p ${TS_FK_WATCH_LIST_DIR} || exit 1
	mkdir -p ${TS_PK_BROKER_DIR} || exit 1
	mkdir -p ${TS_FK_BROKER_DIR} || exit 1
	mkdir -p ${TS_PK_CASH_TRANSACTION_DIR} || exit 1
	mkdir -p ${TS_FK_CASH_TRANSACTION_DIR} || exit 1
	mkdir -p ${TS_PK_CHARGE_DIR} || exit 1
	mkdir -p ${TS_FK_CHARGE_DIR} || exit 1
	mkdir -p ${TS_PK_COMMISSION_RATE_DIR} || exit 1
	mkdir -p ${TS_FK_COMMISSION_RATE_DIR} || exit 1
	mkdir -p ${TS_PK_SETTLEMENT_DIR} || exit 1
	mkdir -p ${TS_FK_SETTLEMENT_DIR} || exit 1
	mkdir -p ${TS_PK_TRADE_DIR} || exit 1
	mkdir -p ${TS_FK_TRADE_DIR} || exit 1
	mkdir -p ${TS_PK_TRADE_HISTORY_DIR} || exit 1
	mkdir -p ${TS_FK_TRADE_HISTORY_DIR} || exit 1
	mkdir -p ${TS_PK_TRADE_REQUEST_DIR} || exit 1
	mkdir -p ${TS_FK_TRADE_REQUEST_DIR} || exit 1
	mkdir -p ${TS_PK_TRADE_TYPE_DIR} || exit 1
	mkdir -p ${TS_PK_COMPANY_DIR} || exit 1
	mkdir -p ${TS_FK_COMPANY_DIR} || exit 1
	mkdir -p ${TS_PK_COMPANY_COMPETITOR_DIR} || exit 1
	mkdir -p ${TS_FK_COMPANY_COMPETITOR_DIR} || exit 1
	mkdir -p ${TS_PK_DAILY_MARKET_DIR} || exit 1
	mkdir -p ${TS_FK_DAILY_MARKET_DIR} || exit 1
	mkdir -p ${TS_PK_EXCHANGE_DIR} || exit 1
	mkdir -p ${TS_FK_EXCHANGE_DIR} || exit 1
	mkdir -p ${TS_PK_FINANCIAL_DIR} || exit 1
	mkdir -p ${TS_FK_FINANCIAL_DIR} || exit 1
	mkdir -p ${TS_PK_INDUSTRY_DIR} || exit 1
	mkdir -p ${TS_FK_INDUSTRY_DIR} || exit 1
	mkdir -p ${TS_PK_LAST_TRADE_DIR} || exit 1
	mkdir -p ${TS_FK_LAST_TRADE_DIR} || exit 1
	mkdir -p ${TS_PK_NEWS_ITEM_DIR} || exit 1
	mkdir -p ${TS_PK_NEWS_XREF_DIR} || exit 1
	mkdir -p ${TS_FK_NEWS_XREF_DIR} || exit 1
	mkdir -p ${TS_PK_SECTOR_DIR} || exit 1
	mkdir -p ${TS_PK_SECURITY_DIR} || exit 1
	mkdir -p ${TS_FK_SECURITY_DIR} || exit 1
	mkdir -p ${TS_PK_ADDRESS_DIR} || exit 1
	mkdir -p ${TS_FK_ADDRESS_DIR} || exit 1
	mkdir -p ${TS_PK_STATUS_TYPE_DIR} || exit 1
	mkdir -p ${TS_PK_TAXRATE_DIR} || exit 1
	mkdir -p ${TS_PK_ZIP_CODE_DIR} || exit 1

	TS_PK_ACCOUNT_PERMISSION="TABLESPACE dbt5_pk_account_permission"
	TS_FK_ACCOUNT_PERMISSION="TABLESPACE dbt5_fk_account_permission"
	TS_PK_CUSTOMER="TABLESPACE dbt5_pk_customer"
	TS_FK_CUSTOMER="TABLESPACE dbt5_fk_customer"
	TS_PK_CUSTOMER_ACCOUNT="TABLESPACE dbt5_pk_customer_account"
	TS_FK_CUSTOMER_ACCOUNT="TABLESPACE dbt5_fk_customer_account"
	TS_PK_CUSTOMER_TAXRATE="TABLESPACE dbt5_pk_customer_taxrate"
	TS_FK_CUSTOMER_TAXRATE="TABLESPACE dbt5_fk_customer_taxrate"
	TS_PK_HOLDING="TABLESPACE dbt5_pk_holding"
	TS_FK_HOLDING="TABLESPACE dbt5_fk_holding"
	TS_PK_HOLDING_HISTORY="TABLESPACE dbt5_pk_holding_history"
	TS_FK_HOLDING_HISTORY="TABLESPACE dbt5_fk_holding_history"
	TS_PK_HOLDING_SUMMARY="TABLESPACE dbt5_pk_holding_summary"
	TS_FK_HOLDING_SUMMARY="TABLESPACE dbt5_fk_holding_summary"
	TS_PK_WATCH_ITEM="TABLESPACE dbt5_pk_watch_item"
	TS_FK_WATCH_ITEM="TABLESPACE dbt5_fk_watch_item"
	TS_PK_WATCH_LIST="TABLESPACE dbt5_pk_watch_list"
	TS_FK_WATCH_LIST="TABLESPACE dbt5_fk_watch_list"
	TS_PK_BROKER="TABLESPACE dbt5_pk_broker"
	TS_FK_BROKER="TABLESPACE dbt5_fk_broker"
	TS_PK_CASH_TRANSACTION="TABLESPACE dbt5_pk_cash_transaction"
	TS_FK_CASH_TRANSACTION="TABLESPACE dbt5_fk_cash_transaction"
	TS_PK_CHARGE="TABLESPACE dbt5_pk_charge"
	TS_FK_CHARGE="TABLESPACE dbt5_fk_charge"
	TS_PK_COMMISSION_RATE="TABLESPACE dbt5_pk_commission_rate"
	TS_FK_COMMISSION_RATE="TABLESPACE dbt5_fk_commission_rate"
	TS_PK_SETTLEMENT="TABLESPACE dbt5_pk_settlement"
	TS_FK_SETTLEMENT="TABLESPACE dbt5_fk_settlement"
	TS_PK_TRADE="TABLESPACE dbt5_pk_trade"
	TS_FK_TRADE="TABLESPACE dbt5_fk_trade"
	TS_PK_TRADE_HISTORY="TABLESPACE dbt5_pk_trade_history"
	TS_FK_TRADE_HISTORY="TABLESPACE dbt5_fk_trade_history"
	TS_PK_TRADE_REQUEST="TABLESPACE dbt5_pk_trade_request"
	TS_FK_TRADE_REQUEST="TABLESPACE dbt5_fk_trade_request"
	TS_PK_TRADE_TYPE="TABLESPACE dbt5_pk_trade_type"
	TS_PK_COMPANY="TABLESPACE dbt5_pk_company"
	TS_FK_COMPANY="TABLESPACE dbt5_fk_company"
	TS_PK_COMPANY_COMPETITOR="TABLESPACE dbt5_pk_company_competitor"
	TS_FK_COMPANY_COMPETITOR="TABLESPACE dbt5_fk_company_competitor"
	TS_PK_DAILY_MARKET="TABLESPACE dbt5_pk_daily_market"
	TS_FK_DAILY_MARKET="TABLESPACE dbt5_fk_daily_market"
	TS_PK_EXCHANGE="TABLESPACE dbt5_pk_exchange"
	TS_FK_EXCHANGE="TABLESPACE dbt5_fk_exchange"
	TS_PK_FINANCIAL="TABLESPACE dbt5_pk_financial"
	TS_FK_FINANCIAL="TABLESPACE dbt5_fk_financial"
	TS_PK_INDUSTRY="TABLESPACE dbt5_pk_industry"
	TS_FK_INDUSTRY="TABLESPACE dbt5_fk_industry"
	TS_PK_LAST_TRADE="TABLESPACE dbt5_pk_last_trade"
	TS_FK_LAST_TRADE="TABLESPACE dbt5_fk_last_trade"
	TS_PK_NEWS_ITEM="TABLESPACE dbt5_pk_news_item"
	TS_PK_NEWS_XREF="TABLESPACE dbt5_pk_news_xref"
	TS_FK_NEWS_XREF="TABLESPACE dbt5_fk_news_xref"
	TS_PK_SECTOR="TABLESPACE dbt5_pk_sector"
	TS_PK_SECURITY="TABLESPACE dbt5_pk_security"
	TS_FK_SECURITY="TABLESPACE dbt5_fk_security"
	TS_PK_ADDRESS="TABLESPACE dbt5_pk_address"
	TS_FK_ADDRESS="TABLESPACE dbt5_fk_address"
	TS_PK_STATUS_TYPE="TABLESPACE dbt5_pk_status_type"
	TS_PK_TAXRATE="TABLESPACE dbt5_pk_taxrate"
	TS_PK_ZIP_CODE="TABLESPACE dbt5_pk_zip_code"

	#
	# Don't need to '|| exit 1' in case the tablespaces already exist.
	#
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_ACCOUNT_PERMISSION} LOCATION '${TS_PK_ACCOUNT_PERMISSION_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_ACCOUNT_PERMISSION} LOCATION '${TS_FK_ACCOUNT_PERMISSION_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_CUSTOMER} LOCATION '${TS_PK_CUSTOMER_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_CUSTOMER} LOCATION '${TS_FK_CUSTOMER_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_CUSTOMER_ACCOUNT} LOCATION '${TS_PK_CUSTOMER_ACCOUNT_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_CUSTOMER_ACCOUNT} LOCATION '${TS_FK_CUSTOMER_ACCOUNT_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_CUSTOMER_TAXRATE} LOCATION '${TS_PK_CUSTOMER_TAXRATE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_CUSTOMER_TAXRATE} LOCATION '${TS_FK_CUSTOMER_TAXRATE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_HOLDING} LOCATION '${TS_PK_HOLDING_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_HOLDING} LOCATION '${TS_FK_HOLDING_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_HOLDING_HISTORY} LOCATION '${TS_PK_HOLDING_HISTORY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_HOLDING_HISTORY} LOCATION '${TS_FK_HOLDING_HISTORY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_HOLDING_SUMMARY} LOCATION '${TS_PK_HOLDING_SUMMARY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_HOLDING_SUMMARY} LOCATION '${TS_FK_HOLDING_SUMMARY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_WATCH_ITEM} LOCATION '${TS_PK_WATCH_ITEM_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_WATCH_ITEM} LOCATION '${TS_FK_WATCH_ITEM_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_WATCH_LIST} LOCATION '${TS_PK_WATCH_LIST_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_WATCH_LIST} LOCATION '${TS_FK_WATCH_LIST_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_BROKER} LOCATION '${TS_PK_BROKER_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_BROKER} LOCATION '${TS_FK_BROKER_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_CASH_TRANSACTION} LOCATION '${TS_PK_CASH_TRANSACTION_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_CASH_TRANSACTION} LOCATION '${TS_FK_CASH_TRANSACTION_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_CHARGE} LOCATION '${TS_PK_CHARGE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_CHARGE} LOCATION '${TS_FK_CHARGE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_COMMISSION_RATE} LOCATION '${TS_PK_COMMISSION_RATE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_COMMISSION_RATE} LOCATION '${TS_FK_COMMISSION_RATE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_SETTLEMENT} LOCATION '${TS_PK_SETTLEMENT_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_SETTLEMENT} LOCATION '${TS_FK_SETTLEMENT_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_TRADE} LOCATION '${TS_PK_TRADE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_TRADE} LOCATION '${TS_FK_TRADE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_TRADE_HISTORY} LOCATION '${TS_PK_TRADE_HISTORY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_TRADE_HISTORY} LOCATION '${TS_FK_TRADE_HISTORY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_TRADE_REQUEST} LOCATION '${TS_PK_TRADE_REQUEST_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_TRADE_REQUEST} LOCATION '${TS_FK_TRADE_REQUEST_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_TRADE_TYPE} LOCATION '${TS_PK_TRADE_TYPE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_COMPANY} LOCATION '${TS_PK_COMPANY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_COMPANY} LOCATION '${TS_FK_COMPANY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_COMPANY_COMPETITOR} LOCATION '${TS_PK_COMPANY_COMPETITOR_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_COMPANY_COMPETITOR} LOCATION '${TS_FK_COMPANY_COMPETITOR_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_DAILY_MARKET} LOCATION '${TS_PK_DAILY_MARKET_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_DAILY_MARKET} LOCATION '${TS_FK_DAILY_MARKET_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_EXCHANGE} LOCATION '${TS_PK_EXCHANGE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_EXCHANGE} LOCATION '${TS_FK_EXCHANGE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_FINANCIAL} LOCATION '${TS_PK_FINANCIAL_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_FINANCIAL} LOCATION '${TS_FK_FINANCIAL_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_INDUSTRY} LOCATION '${TS_PK_INDUSTRY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_INDUSTRY} LOCATION '${TS_FK_INDUSTRY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_LAST_TRADE} LOCATION '${TS_PK_LAST_TRADE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_LAST_TRADE} LOCATION '${TS_FK_LAST_TRADE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_NEWS_ITEM} LOCATION '${TS_PK_NEWS_ITEM_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_NEWS_XREF} LOCATION '${TS_PK_NEWS_XREF_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_NEWS_XREF} LOCATION '${TS_FK_NEWS_XREF_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_SECTOR} LOCATION '${TS_PK_SECTOR_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_SECURITY} LOCATION '${TS_PK_SECURITY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_SECURITY} LOCATION '${TS_FK_SECURITY_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_ADDRESS} LOCATION '${TS_PK_ADDRESS_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_FK_ADDRESS} LOCATION '${TS_FK_ADDRESS_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_STATUS_TYPE} LOCATION '${TS_PK_STATUS_TYPE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_TAXRATE} LOCATION '${TS_PK_TAXRATE_DIR}';"
	${PSQL} -e -d ${DBNAME} -c "CREATE ${TS_PK_ZIP_CODE} LOCATION '${TS_PK_ZIP_CODE_DIR}';"

	#
	# Rewrite these variables for the actualy index creation.
	#

	TS_PK_ACCOUNT_PERMISSION="USING INDEX ${TS_PK_ACCOUNT_PERMISSION}"
	TS_FK_ACCOUNT_PERMISSION="USING INDEX ${TS_FK_ACCOUNT_PERMISSION}"
	TS_PK_CUSTOMER="USING INDEX ${TS_PK_CUSTOMER}"
	TS_FK_CUSTOMER="USING INDEX ${TS_FK_CUSTOMER}"
	TS_PK_CUSTOMER_ACCOUNT="USING INDEX ${TS_PK_CUSTOMER_ACCOUNT}"
	TS_FK_CUSTOMER_ACCOUNT="USING INDEX ${TS_FK_CUSTOMER_ACCOUNT}"
	TS_PK_CUSTOMER_TAXRATE="USING INDEX ${TS_PK_CUSTOMER_TAXRATE}"
	TS_FK_CUSTOMER_TAXRATE="USING INDEX ${TS_FK_CUSTOMER_TAXRATE}"
	TS_PK_HOLDING="USING INDEX ${TS_PK_HOLDING}"
	TS_FK_HOLDING="USING INDEX ${TS_FK_HOLDING}"
	TS_PK_HOLDING_HISTORY="USING INDEX ${TS_PK_HOLDING_HISTORY}"
	TS_FK_HOLDING_HISTORY="USING INDEX ${TS_FK_HOLDING_HISTORY}"
	TS_PK_HOLDING_SUMMARY="USING INDEX ${TS_PK_HOLDING_SUMMARY}"
	TS_FK_HOLDING_SUMMARY="USING INDEX ${TS_FK_HOLDING_SUMMARY}"
	TS_PK_WATCH_ITEM="USING INDEX ${TS_PK_WATCH_ITEM}"
	TS_FK_WATCH_ITEM="USING INDEX ${TS_FK_WATCH_ITEM}"
	TS_PK_WATCH_LIST="USING INDEX ${TS_PK_WATCH_LIST}"
	TS_FK_WATCH_LIST="USING INDEX ${TS_FK_WATCH_LIST}"
	TS_PK_BROKER="USING INDEX ${TS_PK_BROKER}"
	TS_FK_BROKER="USING INDEX ${TS_FK_BROKER}"
	TS_PK_CASH_TRANSACTION="USING INDEX ${TS_PK_CASH_TRANSACTION}"
	TS_FK_CASH_TRANSACTION="USING INDEX ${TS_FK_CASH_TRANSACTION}"
	TS_PK_CHARGE="USING INDEX ${TS_PK_CHARGE}"
	TS_FK_CHARGE="USING INDEX ${TS_FK_CHARGE}"
	TS_PK_COMMISSION_RATE="USING INDEX ${TS_PK_COMMISSION_RATE}"
	TS_FK_COMMISSION_RATE="USING INDEX ${TS_FK_COMMISSION_RATE}"
	TS_PK_SETTLEMENT="USING INDEX ${TS_PK_SETTLEMENT}"
	TS_FK_SETTLEMENT="USING INDEX ${TS_FK_SETTLEMENT}"
	TS_PK_TRADE="USING INDEX ${TS_PK_TRADE}"
	TS_FK_TRADE="USING INDEX ${TS_FK_TRADE}"
	TS_PK_TRADE_HISTORY="USING INDEX ${TS_PK_TRADE_HISTORY}"
	TS_FK_TRADE_HISTORY="USING INDEX ${TS_FK_TRADE_HISTORY}"
	TS_PK_TRADE_REQUEST="USING INDEX ${TS_PK_TRADE_REQUEST}"
	TS_FK_TRADE_REQUEST="USING INDEX ${TS_FK_TRADE_REQUEST}"
	TS_PK_TRADE_TYPE="USING INDEX ${TS_PK_TRADE_TYPE}"
	TS_PK_COMPANY="USING INDEX ${TS_PK_COMPANY}"
	TS_FK_COMPANY="USING INDEX ${TS_FK_COMPANY}"
	TS_PK_COMPANY_COMPETITOR="USING INDEX ${TS_PK_COMPANY_COMPETITOR}"
	TS_FK_COMPANY_COMPETITOR="USING INDEX ${TS_FK_COMPANY_COMPETITOR}"
	TS_PK_DAILY_MARKET="USING INDEX ${TS_PK_DAILY_MARKET}"
	TS_FK_DAILY_MARKET="USING INDEX ${TS_FK_DAILY_MARKET}"
	TS_PK_EXCHANGE="USING INDEX ${TS_PK_EXCHANGE}"
	TS_FK_EXCHANGE="USING INDEX ${TS_FK_EXCHANGE}"
	TS_PK_FINANCIAL="USING INDEX ${TS_PK_FINANCIAL}"
	TS_FK_FINANCIAL="USING INDEX ${TS_FK_FINANCIAL}"
	TS_PK_INDUSTRY="USING INDEX ${TS_PK_INDUSTRY}"
	TS_FK_INDUSTRY="USING INDEX ${TS_FK_INDUSTRY}"
	TS_PK_LAST_TRADE="USING INDEX ${TS_PK_LAST_TRADE}"
	TS_FK_LAST_TRADE="USING INDEX ${TS_FK_LAST_TRADE}"
	TS_PK_NEWS_ITEM="USING INDEX ${TS_PK_NEWS_ITEM}"
	TS_PK_NEWS_XREF="USING INDEX ${TS_PK_NEWS_XREF}"
	TS_FK_NEWS_XREF="USING INDEX ${TS_FK_NEWS_XREF}"
	TS_PK_SECTOR="USING INDEX ${TS_PK_SECTOR}"
	TS_PK_SECURITY="USING INDEX ${TS_PK_SECURITY}"
	TS_FK_SECURITY="USING INDEX ${TS_FK_SECURITY}"
	TS_PK_ADDRESS="USING INDEX ${TS_PK_ADDRESS}"
	TS_FK_ADDRESS="USING INDEX ${TS_FK_ADDRESS}"
	TS_PK_STATUS_TYPE="USING INDEX ${TS_PK_STATUS_TYPE}"
	TS_PK_TAXRATE="USING INDEX ${TS_PK_TAXRATE}"
	TS_PK_ZIP_CODE="USING INDEX ${TS_PK_ZIP_CODE}"
fi

# PKs

# Clause 2.2.5.1
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE account_permission
ADD CONSTRAINT pk_account_permission PRIMARY KEY (ap_ca_id, ap_tax_id) ${TS_PK_ACCOUNT_PERMISSION};
" || exit 1 &

# Clause 2.2.5.2
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE customer
ADD CONSTRAINT pk_customer PRIMARY KEY (c_id) ${TS_PK_CUSTOMER};
" || exit 1 &

# Clause 2.2.5.3
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE customer_account
ADD CONSTRAINT pk_customer_account PRIMARY KEY (ca_id) ${TS_PK_CUSTOMER_ACCOUNT};
" || exit 1 &

# Clause 2.2.5.4
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE customer_taxrate
ADD CONSTRAINT pk_customer_taxrate PRIMARY KEY (cx_tx_id, cx_c_id) ${TS_PK_CUSTOMER_TAXRATE};
" || exit 1 &

# Clause 2.2.5.5
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE holding
ADD CONSTRAINT pk_holding PRIMARY KEY (h_t_id) ${TS_PK_HOLDING};
" || exit 1 &

# Clause 2.2.5.6
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE holding_history
ADD CONSTRAINT pk_holding_history PRIMARY KEY (hh_h_t_id, hh_t_id) ${TS_PK_HOLDING_HISTORY};
" || exit 1 &

# Clause 2.2.5.7
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE holding_summary
ADD CONSTRAINT pk_holding_summary PRIMARY KEY (hs_ca_id, hs_s_symb) ${TS_PK_HOLDING_SUMMARY};
" || exit 1 &

# Clause 2.2.5.8
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE watch_item
ADD CONSTRAINT pk_watch_item 
PRIMARY KEY (wi_wl_id, wi_s_symb) ${TS_PK_WATCH_ITEM};
" || exit 1 &

# Clause 2.2.5.9
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE watch_list
ADD CONSTRAINT pk_watch_list PRIMARY KEY (wl_id) ${TS_PK_WATCH_LIST};
" || exit 1 &

# Clause 2.2.6.1
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE broker
ADD CONSTRAINT pk_broker PRIMARY KEY (b_id) ${TS_PK_BROKER};
" || exit 1 &

# Clause 2.2.6.2
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE cash_transaction
ADD CONSTRAINT pk_cash_transaction PRIMARY KEY (ct_t_id) ${TS_PK_CASH_TRANSACTION};
" || exit 1 &

# Clause 2.2.6.3
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE charge
ADD CONSTRAINT pk_charge 
PRIMARY KEY (ch_tt_id, ch_c_tier) ${TS_PK_CHARGE};
" || exit 1 &

# Clause 2.2.6.4
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE commission_rate
ADD CONSTRAINT pk_commission_rate 
PRIMARY KEY (cr_c_tier, cr_tt_id, cr_ex_id, cr_from_qty) ${TS_PK_COMMISSION_RATE};
" || exit 1 &

# Clause 2.2.6.5
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE settlement
ADD CONSTRAINT pk_settlement PRIMARY KEY (se_t_id) ${TS_PK_SETTLEMENT};
" || exit 1 &

# Clause 2.2.6.6
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade
ADD CONSTRAINT pk_trade PRIMARY KEY (t_id) ${TS_PK_TRADE};
" || exit 1 &

# Clause 2.2.6.7
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade_history
ADD CONSTRAINT pk_trade_history PRIMARY KEY (th_t_id, th_st_id) ${TS_PK_TRADE_HISTORY};
" || exit 1 &

# Clause 2.2.6.8
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade_request
ADD CONSTRAINT pk_trade_request PRIMARY KEY (tr_t_id) ${TS_PK_TRADE_REQUEST};
" || exit 1 &

# Clause 2.2.6.9
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade_type
ADD CONSTRAINT pk_trade_type PRIMARY KEY (tt_id) ${TS_PK_TRADE_TYPE};
" || exit 1 &

# Clause 2.2.7.1
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE company
ADD CONSTRAINT pk_company PRIMARY KEY (co_id) ${TS_PK_COMPANY};
" || exit 1 &

# Clause 2.2.7.2
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE company_competitor
ADD CONSTRAINT pk_company_competitor 
PRIMARY KEY (cp_co_id, cp_comp_co_id, cp_in_id) ${TS_PK_COMPANY_COMPETITOR};
" || exit 1 &

# Clause 2.2.7.3
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE daily_market
ADD CONSTRAINT pk_daily_market PRIMARY KEY (dm_date, dm_s_symb) ${TS_PK_DAILY_MARKET};
" || exit 1 &

# Clause 2.2.7.4
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE exchange
ADD CONSTRAINT pk_exchange PRIMARY KEY (ex_id) ${TS_PK_EXCHANGE};
" || exit 1 &

# Clause 2.2.7.5
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE financial
ADD CONSTRAINT pk_financial PRIMARY KEY (fi_co_id, fi_year, fi_qtr) ${TS_PK_FINANCIAL};
" || exit 1 &

# Clause 2.2.7.6
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE industry
ADD CONSTRAINT pk_industry PRIMARY KEY (in_id) ${TS_PK_INDUSTRY};
" || exit 1 &

# Clause 2.2.7.7
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE last_trade
ADD CONSTRAINT pk_last_trade PRIMARY KEY (lt_s_symb) ${TS_PK_LAST_TRADE};
" || exit 1 &

# Clause 2.2.7.8
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE news_item
ADD CONSTRAINT pk_news_item PRIMARY KEY (ni_id) ${TS_PK_NEWS_ITEM};
" || exit 1 &

# Clause 2.2.7.9
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE news_xref
ADD CONSTRAINT pk_news_xref PRIMARY KEY (nx_ni_id, nx_co_id) ${TS_PK_NEWS_XREF};
" || exit 1 &

# Clause 2.2.7.10
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE sector
ADD CONSTRAINT pk_sector PRIMARY KEY (sc_id) ${TS_PK_SECTOR};
" || exit 1 &

# Clause 2.2.7.11
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE security
ADD CONSTRAINT pk_security PRIMARY KEY (s_symb) ${TS_PK_SECURITY};
" || exit 1 &

# Clause 2.2.8.1
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE address
ADD CONSTRAINT pk_address PRIMARY KEY (ad_id) ${TS_PK_ADDRESS};
" || exit 1 &

# Clause 2.2.8.2
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE status_type
ADD CONSTRAINT pk_status_type PRIMARY KEY (st_id) ${TS_PK_STATUS_TYPE};
" || exit 1 &

# Clause 2.2.8.3
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE taxrate
ADD CONSTRAINT pk_taxrate PRIMARY KEY (tx_id) ${TS_PK_TAXRATE};
" || exit 1 &

# Clause 2.2.8.4
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE zip_code
ADD CONSTRAINT pk_zip_code PRIMARY KEY (zc_code) ${TS_PK_ZIP_CODE};
" || exit 1 &

sleep 1

# FKs
# The FKs of each table are stored in the same tablespace

# Clause 2.2.5.1
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE account_permission
ADD CONSTRAINT fk_account_permission_ca FOREIGN KEY (ap_ca_id) 
REFERENCES customer_account (ca_id) ${TS_FK_ACCOUNT_PERMISSION};
" || exit 1 &

# Clause 2.2.5.2
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE customer
ADD CONSTRAINT fk_customer_st FOREIGN KEY (c_st_id) 
REFERENCES status_type (st_id) ${TS_FK_CUSTOMER};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE customer
ADD CONSTRAINT fk_customer_ad FOREIGN KEY (c_ad_id) 
REFERENCES address (ad_id) ${TS_FK_CUSTOMER};
" || exit 1 &

# Clause 2.2.5.3
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE customer_account
ADD CONSTRAINT fk_customer_account_b FOREIGN KEY (ca_b_id) 
REFERENCES broker (b_id) ${TS_FK_CUSTOMER_ACCOUNT};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE customer_account
ADD CONSTRAINT fk_customer_account_c FOREIGN KEY (ca_c_id) 
REFERENCES customer (c_id) ${TS_FK_CUSTOMER_ACCOUNT};
" || exit 1 &

# Clause 2.2.5.4
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE customer_taxrate
ADD CONSTRAINT fk_customer_taxrate_tx FOREIGN KEY (cx_tx_id) 
REFERENCES taxrate (tx_id) ${TS_FK_CUSTOMER_TAXRATE};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE customer_taxrate
ADD CONSTRAINT fk_customer_taxrate_c FOREIGN KEY (cx_c_id) 
REFERENCES customer (c_id) ${TS_FK_CUSTOMER_ACCOUNT};
" || exit 1 &

# Clause 2.2.5.5
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE holding
ADD CONSTRAINT fk_holding_t FOREIGN KEY (h_t_id) 
REFERENCES trade (t_id) ${TS_FK_HOLDING};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE holding
ADD CONSTRAINT fk_holding_hs FOREIGN KEY (h_ca_id, h_s_symb) 
REFERENCES holding_summary (hs_ca_id, hs_s_symb) ${TS_FK_HOLDING};
" || exit 1 &

# Clause 2.2.5.6
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE holding_history
ADD CONSTRAINT fk_holding_history_t1 FOREIGN KEY (hh_h_t_id) 
REFERENCES trade (t_id) ${TS_FK_HOLDING_HISTORY};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE holding_history
ADD CONSTRAINT fk_holding_history_t2 FOREIGN KEY (hh_t_id) 
REFERENCES trade (t_id) ${TS_FK_HOLDING_HISTORY};
" || exit 1 &

# Clause 2.2.5.7
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE holding_summary
ADD CONSTRAINT fk_holding_summary_ca FOREIGN KEY (hs_ca_id) 
REFERENCES customer_account (ca_id) ${TS_FK_HOLDING_SUMMARY};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE holding_summary
ADD CONSTRAINT fk_holding_summary_s FOREIGN KEY (hs_s_symb) 
REFERENCES security (s_symb) ${TS_FK_HOLDING_SUMMARY};
" || exit 1 &

# Clause 2.2.5.8
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE watch_item
ADD CONSTRAINT fk_watch_item_wl FOREIGN KEY (wi_wl_id) 
REFERENCES watch_list (wl_id) ${TS_FK_WATCH_ITEM};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE watch_item
ADD CONSTRAINT fk_watch_item_s FOREIGN KEY (wi_s_symb) 
REFERENCES security (s_symb) ${TS_FK_WATCH_ITEM};
" || exit 1 &

# Clause 2.2.5.9
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE watch_list
ADD CONSTRAINT fk_watch_list FOREIGN KEY (wl_c_id) 
REFERENCES customer (c_id) ${TS_FK_WATCH_LIST};
" || exit 1 &

# Clause 2.2.6.1
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE broker
ADD CONSTRAINT fk_broker FOREIGN KEY (b_st_id) 
REFERENCES status_type (st_id) ${TS_FK_BROKER};
" || exit 1 &

# Clause 2.2.6.2
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE cash_transaction
ADD CONSTRAINT fk_cash_transaction FOREIGN KEY (ct_t_id) 
REFERENCES trade (t_id) ${TS_FK_CASH_TRANSACTION};
" || exit 1 &

# Clause 2.2.6.3
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE charge
ADD CONSTRAINT fk_charge FOREIGN KEY (ch_tt_id) 
REFERENCES trade_type (tt_id) ${TS_FK_CHARGE};
" || exit 1 &

# Clause 2.2.6.4
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE commission_rate
ADD CONSTRAINT fk_commission_rate_tt FOREIGN KEY (cr_tt_id) 
REFERENCES trade_type (tt_id) ${TS_FK_COMMISSION_RATE};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE commission_rate
ADD CONSTRAINT fk_commission_rate_ex FOREIGN KEY (cr_ex_id) 
REFERENCES exchange (ex_id) ${TS_FK_COMMISSION_RATE};
" || exit 1 &

# Clause 2.2.6.5
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE settlement
ADD CONSTRAINT fk_settlement FOREIGN KEY (se_t_id) 
REFERENCES trade (t_id) ${TS_FK_SETTLEMENT};
" || exit 1 &

# Clause 2.2.6.6
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade
ADD CONSTRAINT fk_trade_st FOREIGN KEY (t_st_id) 
REFERENCES status_type (st_id) ${TS_FK_TRADE};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade
ADD CONSTRAINT fk_trade_tt FOREIGN KEY (t_tt_id) 
REFERENCES trade_type (tt_id) ${TS_FK_TRADE};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade
ADD CONSTRAINT fk_trade_s FOREIGN KEY (t_s_symb) 
REFERENCES security (s_symb) ${TS_FK_TRADE};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade
ADD CONSTRAINT fk_trade_ca FOREIGN KEY (t_ca_id) 
REFERENCES customer_account (ca_id) ${TS_FK_TRADE};
" || exit 1 &

# Clause 2.2.6.7
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade_history
ADD CONSTRAINT fk_trade_history_t FOREIGN KEY (th_t_id) 
REFERENCES trade (t_id) ${TS_FK_TRADE_HISTORY};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade_history
ADD CONSTRAINT fk_trade_history_st FOREIGN KEY (th_st_id) 
REFERENCES status_type (st_id) ${TS_FK_TRADE_HISTORY};
" || exit 1 &

# Clause 2.2.6.8
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade_request
ADD CONSTRAINT fk_trade_request_t FOREIGN KEY (tr_t_id) 
REFERENCES trade (t_id) ${TS_FK_TRADE_REQUEST};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade_request
ADD CONSTRAINT fk_trade_request_tt FOREIGN KEY (tr_tt_id) 
REFERENCES trade_type (tt_id) ${TS_FK_TRADE_REQUEST};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade_request
ADD CONSTRAINT fk_trade_request_s FOREIGN KEY (tr_s_symb) 
REFERENCES security (s_symb) ${TS_FK_TRADE_REQUEST};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE trade_request
ADD CONSTRAINT fk_trade_request_ca FOREIGN KEY (tr_ca_id) 
REFERENCES customer_account (ca_id) ${TS_FK_TRADE_REQUEST};
" || exit 1 &

# Clause 2.2.7.1
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE company
ADD CONSTRAINT fk_company_st FOREIGN KEY (co_st_id) 
REFERENCES status_type (st_id) ${TS_FK_COMPANY};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE company
ADD CONSTRAINT fk_company_in FOREIGN KEY (co_in_id) 
REFERENCES industry (in_id) ${TS_FK_COMPANY};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE company
ADD CONSTRAINT fk_company_ad FOREIGN KEY (co_ad_id) 
REFERENCES address (ad_id) ${TS_FK_COMPANY};
" || exit 1 &

# Clause 2.2.7.2
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE company_competitor
ADD CONSTRAINT fk_company_competitor_co FOREIGN KEY (cp_co_id) 
REFERENCES company (co_id) ${TS_FK_COMPANY_COMPETITOR};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE company_competitor
ADD CONSTRAINT fk_company_competitor_co2 FOREIGN KEY (cp_comp_co_id) 
REFERENCES company (co_id) ${TS_FK_COMPANY_COMPETITOR};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE company_competitor
ADD CONSTRAINT fk_company_competitor_in FOREIGN KEY (cp_in_id) 
REFERENCES industry (in_id) ${TS_FK_COMPANY_COMPETITOR};
" || exit 1 &

# Clause 2.2.7.3
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE daily_market
ADD CONSTRAINT fk_daily_market FOREIGN KEY (dm_s_symb) 
REFERENCES security (s_symb) ${TS_FK_DAILY_MARKET};
" || exit 1 &

# Clause 2.2.7.4
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE exchange
ADD CONSTRAINT fk_exchange FOREIGN KEY (ex_ad_id) 
REFERENCES address (ad_id) ${TS_FK_EXCHANGE};
" || exit 1 &

# Clause 2.2.7.5
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE financial
ADD CONSTRAINT fk_financial FOREIGN KEY (fi_co_id) 
REFERENCES company (co_id) ${TS_FK_FINANCIAL};
" || exit 1 &

# Clause 2.2.7.6
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE industry
ADD CONSTRAINT fk_industry FOREIGN KEY (in_sc_id) 
REFERENCES sector (sc_id) ${TS_FK_INDUSTRY};
" || exit 1 &

# Clause 2.2.7.7
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE last_trade
ADD CONSTRAINT fk_last_trade FOREIGN KEY (lt_s_symb) 
REFERENCES security (s_symb) ${TS_FK_LAST_TRADE};
" || exit 1 &

# Clause 2.2.7.9
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE news_xref
ADD CONSTRAINT fk_news_xref_ni FOREIGN KEY (nx_ni_id) 
REFERENCES news_item (ni_id) ${TS_FK_NEWS_XREF};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE news_xref
ADD CONSTRAINT fk_news_xref_co FOREIGN KEY (nx_co_id) 
REFERENCES company (co_id) ${TS_FK_NEWS_XREF};
" || exit 1 &

# Clause 2.2.7.11
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE security
ADD CONSTRAINT fk_security_st FOREIGN KEY (s_st_id) 
REFERENCES status_type (st_id) ${TS_FK_SECURITY};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE security
ADD CONSTRAINT fk_security_ex FOREIGN KEY (s_ex_id) 
REFERENCES exchange (ex_id) ${TS_FK_SECURITY};
" || exit 1 &

${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE security
ADD CONSTRAINT fk_security_co FOREIGN KEY (s_co_id) 
REFERENCES company (co_id) ${TS_FK_SECURITY};
" || exit 1 &

# Clause 2.2.8.1
${PSQL} -e -d ${DBNAME} -c "
ALTER TABLE address
ADD CONSTRAINT fk_address FOREIGN KEY (ad_zc_code) 
REFERENCES zip_code (zc_code) ${TS_FK_ADDRESS};
" || exit 1 &

wait

exit 0