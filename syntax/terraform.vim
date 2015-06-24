" Forked from Larry Gilbert's syntax file
" github.com/L2G/vim-syntax-terraform

if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword terraSection connection output provider variable
syn keyword terraValueBool true false on off yes no

""" resource

" find . -name "resource_*.go" -not -name "resource_*_test.go" -not -name "resource_provider.go" | sed 's/.*\/resource_//; s/\.go$//'
syn keyword terraResourceTypeBI openstack_compute_keypair_v2
	\ openstack_networking_network_v2 openstack_lb_monitor_v1
	\ openstack_compute_instance_v2 openstack_fw_rule_v1
	\ openstack_compute_floatingip_v2 openstack_networking_subnet_v2
	\ openstack_compute_secgroup_v2 openstack_networking_floatingip_v2
	\ openstack_networking_router_v2 openstack_lb_pool_v1 openstack_lb_vip_v1
	\ openstack_blockstorage_volume_v1 openstack_objectstorage_container_v1
	\ openstack_fw_policy_v1 openstack_networking_router_interface_v2
	\ openstack_fw_firewall_v1 aws_route53_health_check aws_iam_user_policy
	\ aws_ebs_volume aws_vpc_peering_connection aws_ecs_task_definition
	\ aws_elasticache_subnet_group aws_kinesis_stream aws_ecs_service
	\ aws_route53_zone aws_subnet aws_route_table_association aws_network_acl
	\ aws_db_security_group aws_iam_access_key aws_security_group
	\ aws_autoscaling_policy aws_internet_gateway aws_iam_group_policy
	\ aws_security_group_rule_migrate aws_vpc_dhcp_options_association aws_flow_log
	\ aws_iam_policy aws_db_parameter_group aws_dynamodb_table aws_ecs_cluster
	\ aws_iam_group_membership aws_instance aws_proxy_protocol_policy aws_vpc
	\ aws_iam_role_policy aws_network_interface aws_sns_topic aws_s3_bucket
	\ aws_db_instance aws_elasticache_security_group aws_iam_user
	\ aws_customer_gateway aws_autoscaling_notification aws_cloudwatch_metric_alarm
	\ aws_volume_attachment aws_iam_role aws_key_pair aws_autoscaling_group
	\ aws_route53_zone_association aws_iam_group aws_lambda_function
	\ aws_security_group_rule aws_instance_migrate vpn_connection_route
	\ aws_vpn_gateway aws_main_route_table_association
	\ aws_app_cookie_stickiness_policy aws_elasticache_cluster aws_route53_record
	\ aws_route53_delegation_set aws_route_table aws_vpn_connection
	\ aws_launch_configuration aws_sns_topic_subscription aws_vpc_dhcp_options
	\ aws_sqs_queue aws_iam_instance_profile aws_eip aws_db_subnet_group
	\ aws_lb_cookie_stickiness_policy aws_spot_instance_request
	\ aws_iam_server_certificate aws_elb heroku_addon heroku_drain heroku_app
	\ heroku_domain heroku_cert consul_keys mailgun_domain digitalocean_domain
	\ digitalocean_ssh_key digitalocean_record digitalocean_droplet docker_container
	\ docker_container_funcs docker_image docker_image_funcs
	\ compute_http_health_check compute_address compute_forwarding_rule
	\ compute_network compute_instance_migrate compute_target_pool
	\ compute_instance_template compute_disk storage_bucket dns_record_set
	\ compute_instance compute_route compute_firewall dns_managed_zone
	\ cloudstack_vpn_customer_gateway cloudstack_instance cloudstack_egress_firewall
	\ cloudstack_firewall cloudstack_port_forward cloudstack_vpc
	\ cloudstack_network_acl cloudstack_vpn_connection cloudstack_disk
	\ cloudstack_ipaddress cloudstack_network_acl_rule cloudstack_network
	\ cloudstack_ssh_keypair cloudstack_nic cloudstack_template
	\ cloudstack_vpn_gateway test cloudflare_record dme_record dnsimple_record
	\ azure_storage_blob azure_storage_service azure_local_network
	\ azure_storage_container azure_storage_queue azure_instance
	\ azure_affinity_group azure_sql_database_service azure_virtual_network
	\ azure_security_group azure_dns_server azure_data_disk azure_hosted_service
	\ azure_security_group_rule azure_sql_database_server state artifact

syn keyword terraTodo         contained TODO FIXME XXX BUG
syn cluster terraCommentGroup contains=terraTodo
syn region  terraComment      start="/\*" end="\*/" contains=@terraCommentGroup,@Spell
syn region  terraComment      start="#" end="$" contains=@terraCommentGroup,@Spell

syn match  terraResource        /\<resource\>/ nextgroup=terraResourceTypeStr skipwhite
syn region terraResourceTypeStr start=/"/ end=/"/ contains=terraResourceTypeBI
                              \ nextgroup=terraResourceName skipwhite
syn region terraResourceName    start=/"/ end=/"/
                              \ nextgroup=terraResourceBlock skipwhite
""" provider
syn match  terraProvider      /\<provider\>/ nextgroup=terraProviderName skipwhite
syn region terraProviderName  start=/"/ end=/"/ nextgroup=terraProviderBlock skipwhite

""" provisioner
syn match  terraProvisioner     /\<provisioner\>/ nextgroup=terraProvisionerName skipwhite
syn region terraProvisionerName start=/"/ end=/"/ nextgroup=terraProvisionerBlock skipwhite

""" module
syn match  terraModule     /\<module\>/ nextgroup=terraModuleName skipwhite
syn region terraModuleName start=/"/ end=/"/ nextgroup=terraModuleBlock skipwhite

""" misc.
syn match terraValueDec      "\<[0-9]\+\([kKmMgG]b\?\)\?\>"
syn match terraValueHexaDec  "\<0x[0-9a-f]\+\([kKmMgG]b\?\)\?\>"
syn match	terraBraces	       "[{}\[\]]"

syn region terraValueString  start=/"/    end=/"/    contains=terraStringInterp
syn region terraStringInterp matchgroup=terraBrackets start=/\${/  end=/}/ contained

hi def link terraComment           Comment
hi def link terraTodo              Todo
hi def link terraBrackets          Operator
hi def link terraProvider          Structure
hi def link terraBraces            Delimiter
hi def link terraProviderName      String
hi def link terraResource          Structure
hi def link terraResourceName      String
hi def link terraResourceTypeBI    Tag
hi def link terraResourceTypeStr   String
hi def link terraSection           Structure
hi def link terraStringInterp      Identifier
hi def link terraValueBool         Boolean
hi def link terraValueDec          Number
hi def link terraValueHexaDec      Number
hi def link terraValueString       String
hi def link terraProvisioner       Structure
hi def link terraProvisionerName   String
hi def link terraModule            Structure
hi def link terraModuleName        String

let b:current_syntax = "terraform"
