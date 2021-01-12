INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	85	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_max{pool=~".*Eden Space.*", job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'METRIC'	,	 'Max {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	35	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	86	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_used{pool=~".*Eden Space.*",job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'METRIC'	,	 'Used {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	35	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	87	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_committed{pool=~".*Eden Space.*",job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'METRIC'	,	 'Commited {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	35	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	88	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_max{pool=~".*Old Gen|Tenured Gen.*", job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'METRIC'	,	 'Max {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	36	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	89	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_used{pool=~".*Old Gen|Tenured Gen.*",job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'METRIC'	,	 'Used {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	36	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	90	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_committed{pool=~".*Old Gen|Tenured Gen.*",job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'METRIC'	,	 'Commited {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	36	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	103	,	 '/api/v1/query_range?query=sum(tomcat_requestcount_total{application="$application", instance=~"$instance"})'	,	 'METRIC'	,	 'Request'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	46	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	110	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_max{pool=~".*Eden Space.*",application=~"$application", instance=~"$instance"}'	,	 'METRIC'	,	 'Max'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	49	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	111	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_used{pool=~".*Eden Space.*",application=~"$application", instance=~"$instance"}'	,	 'METRIC'	,	 'Used'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	49	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	112	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_committed{pool=~".*Eden Space.*",application=~"$application", instance=~"$instance"}'	,	 'METRIC'	,	 'Commited'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	49	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	113	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_max{pool=~".*Old Gen|Tenured Gen.*",application=~"$application", instance=~"$instance"}'	,	 'METRIC'	,	 'Max'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	50	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	114	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_used{pool=~".*Old Gen|Tenured Gen.*",application=~"$application", instance=~"$instance"}'	,	 'METRIC'	,	 'Used'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	50	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	115	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_committed{pool=~".*Old Gen|Tenured Gen.*", application=~"$application", instance=~"$instance"}'	,	 'METRIC'	,	 'Commited'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	50	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	260	,	 '/api/v1/query?query=label_replace(count(kube_deployment_created{deployment=~"$services"}) by (deployment), "application", "$1", "deployment", "(.*)-deploy") * on (application) group_left(namespace) count(jvm_info) by (namespace, application) or on (application) label_replace(count(kube_deployment_created{deployment=~"$services"}) by (deployment), "application", "$1", "deployment", "(.*)-deploy") * -1'	,	 'METRIC'	,	 '{{application}}'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	138	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	261	,	 '/api/v1/query?query=avg((increase(tomcat_processingtime_total{job="jmx-metrics", application=~"$services"}[1m]) / increase(tomcat_requestcount_total{job="jmx-metrics", application=~"$services"}[1m])) > 0) by (application)'	,	 'METRIC'	,	 'responsetime-{{application}}'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	138	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	262	,	 '/api/v1/query_range?query=(sum(tomcat_requestcount_total{job="jmx-metrics",application=~".*"}) - sum(tomcat_errorcount_total{job="jmx-metrics",application=~".*"}))/sum(tomcat_requestcount_total{job="jmx-metrics",application=~".*"})*100'	,	 'METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	139	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	263	,	 '/api/v1/query_range?query=avg(sum(increase(tomcat_processingtime_total{job="jmx-metrics", application=~".*"}[1m]))/sum(increase(tomcat_requestcount_total{job="jmx-metrics", application=~".*"}[1m])))'	,	 'METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	140	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	264	,	 '/api/v1/query_range?query=sum(tomcat_requestcount_total{job="jmx-metrics",application=~".*"})'	,	 'METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	141	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	272	,	 '/api/v1/query?query=label_replace(count(kube_deployment_created{deployment=~"$services"}) by (deployment), "application", "$1", "deployment", "(.*)-deploy") * on (application) group_left(namespace) count(jvm_info) by (namespace, application) or on (application) label_replace(count(kube_deployment_created{deployment=~"$services"}) by (deployment), "application", "$1", "deployment", "(.*)-deploy") * -1'	,	 'METRIC'	,	 '{{application}}'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	147	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	273	,	 '/api/v1/query?query=avg((increase(tomcat_processingtime_total{job="jmx-metrics", application=~"$services"}[1m]) / increase(tomcat_requestcount_total{job="jmx-metrics", application=~"$services"}[1m])) > 0) by (application)'	,	 'METRIC'	,	 'responsetime-{{application}}'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	147	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	274	,	 '/api/v1/query_range?query=(sum(tomcat_requestcount_total{job="jmx-metrics",application=~".*"}) - sum(tomcat_errorcount_total{job="jmx-metrics",application=~".*"}))/sum(tomcat_requestcount_total{job="jmx-metrics",application=~".*"})*100'	,	 'METRIC'	,	 'Transaction'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	148	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	275	,	 '/api/v1/query_range?query=avg(sum(increase(tomcat_processingtime_total{job="jmx-metrics", application=~".*"}[1m]))/sum(increase(tomcat_requestcount_total{job="jmx-metrics", application=~".*"}[1m])))'	,	 'METRIC'	,	 'Avg. Response time'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	149	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	276	,	 '/api/v1/query_range?query=sum(tomcat_requestcount_total{job="jmx-metrics",application=~".*"})'	,	 'METRIC'	,	 'Request count'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	150	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values	(	279	,	 '/api/v1/query?query=sum(tomcat_requestcount_total{job="jmx-metrics",application=~"$application"})'	,	 'METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	154	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values	(	283	,	 '/api/v1/query_range?query=sum(increase(tomcat_processingtime_total{job="jmx-metrics", application=~"$application"}[1m]))/sum(increase(tomcat_requestcount_total{job="jmx-metrics", application=~"$application"}[1m]))'	,	 'METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	158	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values	(	284	,	 '/api/v1/query?query=avg(sum(increase(tomcat_processingtime_total{job="jmx-metrics", application=~"$application"}[1m]))/sum(increase(tomcat_requestcount_total{job="jmx-metrics", application=~"$application"}[1m])))'	,	 'METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	159	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values	(	285	,	 '/api/v1/query?query=sum(tomcat_errorcount_total{job="jmx-metrics",application=~"$application"})'	,	 'METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	160	);


INSERT INTO page_variable (VARIABLE_ID, NAME, SORT_ORDER, EDGE_FIELDS, QUERY_TYPE, VARIABLE_TYPE, REFRESH_INTERVAL, HIDDEN_YN, JOB_NAME, API_QUERY,  CREATE_TIME, UPDATE_TIME, PAGE_ID) values (	10	,	 'application'	,	1	,	 ''	,	 'METRIC'	,'metric_label_values'	,	 '10s'	,	 'Y'	,	 'jmx-metrics'	,	 'count(jvm_info * on (application) group_left(deployment) label_replace(count(kube_deployment_created{deployment=~"$services"}) by (deployment), "application", "$1", "deployment", "(.*)-deploy")) by (application)'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	15	);