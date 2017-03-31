#
# Cookbook Name:: custom_tomcat7
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'java'

download_url = 'http://download.nextag.com/apache/tomcat/tomcat-7/v7.0.76/bin/apache-tomcat-7.0.76.zip'
group 'tomcat'
user 'tomcat' do
  group 'tomcat'
  system true
  shell '/bin/bash/'
end

ark 'tomcaturl' do
 url download_url
 home_dir '/opt/tomcat'
 owner 'tomcat'
 group 'tomcat'
end

template '/etc/init.d/tomcat' do
 source 'tomcat-init.erb'
 mode '0755'
 owner 'root'
 group 'root'
end

execute 'chmod' do
 command 'chmod 755 /opt/tomcat/bin/*.ssh'
 action :run
end

execute 'chkconfig'
 command 'chkconfig tomcat on'
 command 'service tomcat start'
 action :run
end
