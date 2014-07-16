#
# Cookbook Name:: sabnzbd
# Recipe:: nzbtomedia
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

git "nzbToMedia" do
  repository node['nzbtomedia']['git_url']
  revision node['nzbtomedia']['git_ref']
  user node["sabnzbd"]["user"]
  group node["sabnzbd"]["group"]
  destination node['nzbtomedia']['install_dir']
end

template "#{node['nzbtomedia']['install_dir']}/autoProcessMedia.cfg" do
  source 'autoProcessMedia.cfg.erb'
  owner node["sabnzbd"]["user"]
  group node["sabnzbd"]["user"]
  mode 00644
end