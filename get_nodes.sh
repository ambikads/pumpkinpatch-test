#Get kiosks from admin with the necessary fields
#!/bin/bash
admin_url=$1
access_token=$2
admin_output="`curl ''"$admin_url"'/kiosks?access_token='"$access_token"'&fields=nodename,hostname,tags,git_ref,state,display_name,test_mode,ip_address'|jq '.data'|sed 's/null/" "/g'`"
echo $admin_output | jq 'map({ "hostname" : .hostname , "tags" : .tags, "nodename" : .nodename, "git_ref" : .git_ref, "state" : .state, "description" : .display_name, "test_mode" : .test_mode, "ip_address" : .ip_address })'
