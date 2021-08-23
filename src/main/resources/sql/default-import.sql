INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	85	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_max{pool="Eden Space", job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'PROXY_METRIC'	,	 'Max {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	35	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	86	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_used{pool="Eden Space",job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'PROXY_METRIC'	,	 'Used {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	35	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	87	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_committed{pool="Eden Space",job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'PROXY_METRIC'	,	 'Commited {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	35	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	88	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_max{pool="Tenured Gen", job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'PROXY_METRIC'	,	 'Max {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	36	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	89	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_used{pool="Tenured Gen",job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'PROXY_METRIC'	,	 'Used {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	36	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	90	,	 '/api/v1/query_range?query=avg(jvm_memory_pool_bytes_committed{pool="Tenured Gen",job="jmx-metrics", application=~"^.*$", instance=~"^.*$"}) by (application)'	,	 'PROXY_METRIC'	,	 'Commited {{application}}'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	36	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	103	,	 '/api/v1/query_range?query=sum(tomcat_requestprocessor_requestcount{application="$application", instance=~"$instance"})'	,	 'PROXY_METRIC'	,	 'Request'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	46	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	110	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_max{pool="Eden Space",application=~"$application", instance=~"$instance"}'	,	 'PROXY_METRIC'	,	 'Max'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	49	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	111	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_used{pool="Eden Space",application=~"$application", instance=~"$instance"}'	,	 'PROXY_METRIC'	,	 'Used'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	49	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	112	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_committed{pool="Eden Space",application=~"$application", instance=~"$instance"}'	,	 'PROXY_METRIC'	,	 'Commited'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	49	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	113	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_max{pool="Tenured Gen",application=~"$application", instance=~"$instance"}'	,	 'PROXY_METRIC'	,	 'Max'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	50	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	114	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_used{pool="Tenured Gen",application=~"$application", instance=~"$instance"}'	,	 'PROXY_METRIC'	,	 'Used'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	50	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	115	,	 '/api/v1/query_range?query=jvm_memory_pool_bytes_committed{pool="Tenured Gen", application=~"$application", instance=~"$instance"}'	,	 'PROXY_METRIC'	,	 'Commited'	,	 '15'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	50	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	260	,	 '/api/v1/query?query=label_replace(count(kube_deployment_created{deployment=~"$services"}) by (deployment), "application", "$1", "deployment", "(.*)(-deploy)?") * on (application) group_left(namespace) count(jvm_info) by (namespace, application) or on (application) label_replace(count(kube_deployment_created{deployment=~"$services"}) by (deployment), "application", "$1", "deployment", "(.*)(-deploy)?") * -1'	,	 'PROXY_METRIC'	,	 '{{application}}'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	138	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	261	,	 '/api/v1/query?query=avg((increase(tomcat_requestprocessor_processingtime{job="jmx-metrics", application=~"$services"}[1m]) / increase(tomcat_requestprocessor_requestcount{job="jmx-metrics", application=~"$services"}[1m])) > 0) by (application)'	,	 'PROXY_METRIC'	,	 'responsetime-{{application}}'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	138	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	262	,	 '/api/v1/query_range?query=(sum(tomcat_requestprocessor_requestcount{job="jmx-metrics",application=~".*"}) - sum(tomcat_requestprocessor_errorcount{job="jmx-metrics",application=~".*"}))/sum(tomcat_requestprocessor_requestcount{job="jmx-metrics",application=~".*"})*100'	,	 'PROXY_METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	139	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	263	,	 '/api/v1/query_range?query=avg(sum(increase(tomcat_requestprocessor_processingtime{job="jmx-metrics", application=~".*"}[1m]))/sum(increase(tomcat_requestprocessor_requestcount{job="jmx-metrics", application=~".*"}[1m])))'	,	 'PROXY_METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	140	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	264	,	 '/api/v1/query_range?query=sum(tomcat_requestprocessor_requestcount{job="jmx-metrics",application=~".*"})'	,	 'PROXY_METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	141	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	272	,	 '/api/v1/query?query=label_replace(count(kube_deployment_created{deployment=~"$services"}) by (deployment), "application", "$1", "deployment", "(.*)(-deploy)?") * on (application) group_left(namespace) count(jvm_info) by (namespace, application) or on (application) label_replace(count(kube_deployment_created{deployment=~"$services"}) by (deployment), "application", "$1", "deployment", "(.*)(-deploy)?") * -1'	,	 'PROXY_METRIC'	,	 '{{application}}'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	147	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	273	,	 '/api/v1/query?query=avg((increase(tomcat_requestprocessor_processingtime{job="jmx-metrics", application=~"$services"}[1m]) / increase(tomcat_requestprocessor_requestcount{job="jmx-metrics", application=~"$services"}[1m])) > 0) by (application)'	,	 'PROXY_METRIC'	,	 'responsetime-{{application}}'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	147	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	274	,	 '/api/v1/query_range?query=(sum(tomcat_requestprocessor_requestcount{job="jmx-metrics",application=~".*"}) - sum(tomcat_requestprocessor_errorcount{job="jmx-metrics",application=~".*"}))/sum(tomcat_requestprocessor_requestcount{job="jmx-metrics",application=~".*"})*100'	,	 'PROXY_METRIC'	,	 'Transaction'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	148	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	275	,	 '/api/v1/query_range?query=avg(sum(increase(tomcat_requestprocessor_processingtime{job="jmx-metrics", application=~".*"}[1m]))/sum(increase(tomcat_requestprocessor_requestcount{job="jmx-metrics", application=~".*"}[1m])))'	,	 'PROXY_METRIC'	,	 'Avg. Response time'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	149	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	276	,	 '/api/v1/query_range?query=sum(tomcat_requestprocessor_requestcount{job="jmx-metrics",application=~".*"})'	,	 'PROXY_METRIC'	,	 'Request count'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	150	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values	(	279	,	 '/api/v1/query?query=sum(tomcat_requestprocessor_requestcount{job="jmx-metrics",application=~"$application"})'	,	 'PROXY_METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	154	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values	(	283	,	 '/api/v1/query_range?query=sum(increase(tomcat_requestprocessor_processingtime{job="jmx-metrics", application=~"$application"}[1m]))/sum(increase(tomcat_requestprocessor_requestcount{job="jmx-metrics", application=~"$application"}[1m]))'	,	 'PROXY_METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	158	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values	(	284	,	 '/api/v1/query?query=avg(sum(increase(tomcat_requestprocessor_processingtime{job="jmx-metrics", application=~"$application"}[1m]))/sum(increase(tomcat_requestprocessor_requestcount{job="jmx-metrics", application=~"$application"}[1m])))'	,	 'PROXY_METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	159	);
INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values	(	285	,	 '/api/v1/query?query=sum(tomcat_requestprocessor_errorcount{job="jmx-metrics",application=~"$application"})'	,	 'PROXY_METRIC'	,	 ''	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	160	);

-- INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values	(	307	,	 '/loki/api/v1/query_range?query=sum(count_over_time({app=~"$application"} [1m])) by (app)'	,	 'PROXY_METRIC'	,	 '총건수'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	168	);
-- INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values	(	308	,	 '/loki/api/v1/query_range?query=sum(count_over_time({app=~"$application"} |="info" [1m])) by (app)'	,	 'PROXY_METRIC'	,	 '정상'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	168	);
-- INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values	(	309	,	 '/loki/api/v1/query_range?query=sum(count_over_time({app=~"$application"} |="error" [1m])) by (app)'	,	 'PROXY_METRIC'	,	 '에러'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	168	);
-- INSERT INTO chart_query (C_QUERY_ID, API_QUERY, QUERY_TYPE, LEGEND, QUERY_STEP, CREATE_TIME, UPDATE_TIME, PANEL_ID) values (	310	,	 ''	,	 'PROXY_METRIC'	,	 'LOG'	,	 '60'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	169	);

INSERT INTO page_variable (VARIABLE_ID, NAME, SORT_ORDER, EDGE_FIELDS, QUERY_TYPE, VARIABLE_TYPE, REFRESH_INTERVAL, HIDDEN_YN, JOB_NAME, API_QUERY,  CREATE_TIME, UPDATE_TIME, PAGE_ID) values (	10	,	 'application'	,	1	,	 ''	,	 'PROXY_METRIC'	,'metric_label_values'	,	 '10s'	,	 'Y'	,	 'jmx-metrics'	,	 'count(jvm_info * on (application) group_left(deployment) label_replace(count(kube_deployment_created{deployment=~"$services"}) by (deployment), "application", "$1", "deployment", "(.*)(-deploy)?")) by (application)'	,	CURRENT_TIMESTAMP()	,	CURRENT_TIMESTAMP()	,	15	);

-- Group, User, Rule, Role
INSERT INTO kw_user_group (GROUPNAME, DESCRIPTION, CREATE_TIME, UPDATE_TIME) values ( 'CLUSTER', '설명1', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO kw_user_group (GROUPNAME, DESCRIPTION, CREATE_TIME, UPDATE_TIME) values ( 'NODE', '설명2', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO kw_user_group (GROUPNAME, DESCRIPTION, CREATE_TIME, UPDATE_TIME) values ( 'DATABASE', '설명3', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO kw_user_group (GROUPNAME, DESCRIPTION, CREATE_TIME, UPDATE_TIME) values ( 'TEST', '테스터 그룹', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());

INSERT INTO kw_user (USERNAME, DEPT, NAME, PASSWORD, USERNO, GROUPNAME, CREATE_TIME, UPDATE_TIME) values ( 'test1', 'ITO', 'KIM.E.H', 'test1', '1000000', 'CLUSTER', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
INSERT INTO kw_user (USERNAME, DEPT, NAME, PASSWORD, USERNO, GROUPNAME, CREATE_TIME, UPDATE_TIME) values ( 'test2', 'ITG', 'PARK.J.H', 'test2', '1100000', 'CLUSTER', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

INSERT INTO kw_user_role_rule (RULE_ID, DESCRIPTION, RULE_NAME, RULE, CREATE_TIME, UPDATE_TIME) values ( 1,  '설명123abd' ,'Operator', '111111111111111111111111111111111111111111111',  CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO kw_user_role_rule (RULE_ID, DESCRIPTION, RULE_NAME, RULE, CREATE_TIME, UPDATE_TIME) values ( 2,  '설명123abd' ,'Monitor', '110111011111011111011101111011101100001111111',  CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO kw_user_role_rule (RULE_ID, DESCRIPTION, RULE_NAME, RULE, CREATE_TIME, UPDATE_TIME) values ( 3,  '설명123abd' ,'Manager', '000001111111000011110011111000011001101100111',  CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());

INSERT INTO kw_user_role (ROLENAME, USERNAME, RULE_ID, CREATE_TIME, UPDATE_TIME) values ( 'Operator', 'test1', 1, CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO kw_user_role (ROLENAME, USERNAME, RULE_ID, CREATE_TIME, UPDATE_TIME) values ( 'Manager', 'test2', 1, CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());


-- Alert Rule
INSERT INTO alert_rule_metric (TYPE, CATEGORY, RESOURCE,  METRIC_NAME, EXPRESSION, CREATE_TIME, UPDATE_TIME) values ('METRIC', 'NODE', 'CPU', 'node', '(1 - (avg by (node)(irate(node_cpu_seconds_total{mode="idle",zone!="external"}[5m])))) * 100 >= %d', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO alert_rule_metric (TYPE, CATEGORY, RESOURCE,  METRIC_NAME, EXPRESSION, CREATE_TIME, UPDATE_TIME) values ('METRIC', 'NODE', 'MEMORY', 'node', '(1 - sum by (node)(node_memory_MemAvailable_bytes{node!="",zone!="external"}) / sum by (node)(node_memory_MemTotal_bytes{node!="",zone!="external"})) * 100 >= %d', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO alert_rule_metric (TYPE, CATEGORY, RESOURCE,  METRIC_NAME, EXPRESSION, CREATE_TIME, UPDATE_TIME) values ('METRIC', 'NODE', 'DISK', 'node', '(sum by (node)(node_filesystem_size_bytes{device!~"rootfs|HarddiskVolume.+",node!="", zone!="external"}) - sum  by (node)(node_filesystem_free_bytes{device!~"rootfs|HarddiskVolume.+",node!="", zone!="external"})) / sum by (node)(node_filesystem_size_bytes{device!~"rootfs|HarddiskVolume.+",node!="", zone!="external"}) * 100 >= %d', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO alert_rule_metric (TYPE, CATEGORY, RESOURCE,  METRIC_NAME, EXPRESSION, CREATE_TIME, UPDATE_TIME) values ('METRIC', 'POD', 'CPU', 'pod_name', '(sum by (pod_name)(rate(container_cpu_usage_seconds_total{container_name!="",container_name!="POD"}[5m])) * 100) >= %d', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO alert_rule_metric (TYPE, CATEGORY, RESOURCE,  METRIC_NAME, EXPRESSION, CREATE_TIME, UPDATE_TIME) values ('METRIC', 'POD', 'MEMORY', 'pod', '100 * (sum by(pod) (container_memory_working_set_bytes{container_name!="",container_name!="POD",pod_name=~".*"}) / on (pod) sum by (pod)(kube_pod_container_resource_requests_memory_bytes{pod=~".*"}) or sum by(pod) (container_memory_working_set_bytes{container_name!="",container_name!="POD",pod_name=~".*"}) / %s) >= %d', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO alert_rule_metric (TYPE, CATEGORY, RESOURCE,  METRIC_NAME, EXPRESSION, MESSAGE_TEMPLATE, CREATE_TIME, UPDATE_TIME) values ('LOG', 'EVENT', 'STRING', '', 'NOOP', '%s', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO alert_rule_metric (TYPE, CATEGORY, RESOURCE,  METRIC_NAME, EXPRESSION, MESSAGE_TEMPLATE, CREATE_TIME, UPDATE_TIME) values ('LOG', 'LOG', 'STRING', '', '/loki/api/v1/query_range?direction=BACKWARD&query={app=~".*"}|~"%s"', '%s', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());

INSERT INTO alert_rule (TYPE, CATEGORY, RESOURCE,  DETECT_STRING, DANGER_LEVEL, WARNING_LEVEL, DURATION, SEVERITY, CREATE_TIME, UPDATE_TIME) values ('METRIC', 'NODE', 'CPU', '', 30, 12, 5, '', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
INSERT INTO alert_rule (TYPE, CATEGORY, RESOURCE,  DETECT_STRING, DANGER_LEVEL, WARNING_LEVEL, DURATION, SEVERITY, CREATE_TIME, UPDATE_TIME) values ('METRIC', 'NODE', 'MEMORY', '', 53, 51, 5, '', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());
-- INSERT INTO alert_rule (TYPE, CATEGORY, RESOURCE,  DETECT_STRING, DANGER_LEVEL, WARNING_LEVEL, DURATION, SEVERITY, CREATE_TIME, UPDATE_TIME) values ('LOG', 'EVENT', 'STRING', 'Liveness probe failed', 0, 0, 0, 'Warning', CURRENT_TIMESTAMP(),   CURRENT_TIMESTAMP());

