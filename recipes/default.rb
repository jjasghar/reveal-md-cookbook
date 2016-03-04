# Author:: JJ Asghar <jj@chef.io>
# Cookbook Name:: reveal-md
# Recipe:: default
#
# Copyright 2016 Chef Software, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# What're you looking at? I know what I'm doing.
#                          - Han Solo
#

package "curl"

execute "install nodejs PPA YOLO" do
  command "curl -sL https://deb.nodesource.com/setup | sudo bash -"
  creates "/etc/apt/sources.list.d/nodesource.list"
  action :run
end

execute "Update the apt-cache" do
  command "sudo apt-get update"
  action :run
end

%w{build-essential git nodejs daemon}.each do |pkg|
  package pkg do
    action [:install]
  end
end

cookbook_file "/tmp/reveal.json" do
  mode "0644"
  source "reveal.json"
end

cookbook_file "/tmp/index.md" do
  mode "0644"
  source "index.md"
end

execute "install reveal-md" do
  creates "/usr/bin/reveal-md"
  command "npm install -g reveal-md"
  action :run
end

cookbook_file "/etc/init.d/nodeserver" do
  mode "755"
  source "nodeserver"
end

service "nodeserver" do
  supports restart: true, start: true, stop: true, reload: true
  action [:enable, :start]
end

log "Open up http://127.0.0.1:1948/index.md in a web browser and you are in the presentation."
