include_recipe "apt::default"

apt_repository "sabnzbd" do
  uri "http://ppa.launchpad.net/jcfp/ppa/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "4BB9F05F"
end

%w{sabnzbdplus sabnzbdplus-theme-plush}.each do |pkg|
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

service "sabnzbdplus" do
  action :start
end

bash "update-rc.d" do
  code "update-rc.d sabnzbdplus defaults"
end
