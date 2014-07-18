#
# Cookbook Name:: sabnzbd
# Recipe:: default
#
# Copyright (C) 2014 G. Arends
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apt::default"

apt_repository "sabnzbd" do
  uri "http://ppa.launchpad.net/jcfp/ppa/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "4BB9F05F"
end

%w{sabnzbdplus sabnzbdplus-theme-plush p7zip}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

template "/etc/default/sabnzbdplus" do
  source "sabnzbd.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, 'service[sabnzbdplus]'
end

directory  "/home/#{node['sabnzbd']['user']}/.sabnzbd/" do
  owner node["sabnzbd"]["user"]
  group node["sabnzbd"]["group"]
  mode "0755"
  recursive true
  action :create
end

template "/home/#{node['sabnzbd']['user']}/.sabnzbd/sabnzbd.ini" do
  source "sabnzbd.ini.erb"
  mode 0600
  notifies :restart, 'service[sabnzbdplus]'
  owner node["sabnzbd"]["user"]
  group node["sabnzbd"]["group"]
end

service "sabnzbdplus" do
  action [ :enable, :start ]
end
