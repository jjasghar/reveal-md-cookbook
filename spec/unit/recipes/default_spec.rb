#
# Cookbook Name:: bootstrap
# Spec:: default
# Copyright 2016, Chef Software, Inc
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

require "spec_helper"

describe "reveal-md::default" do

  context "When all attributes are default, on an unspecified platform" do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it "converges successfully" do
      chef_run # This should not raise an error
    end

    it "installs curl" do
      expect(chef_run).to install_package("curl")
    end

    it "should install node from node" do
      expect(chef_run).to run_execute("install nodejs PPA YOLO")
    end

    it "should install build-essential" do
      expect(chef_run).to install_package("build-essential")
    end

    it "should install git" do
      expect(chef_run).to install_package("git")
    end

    it "creates /tmp/reveal.json" do
      expect(chef_run).to create_cookbook_file("/tmp/reveal.json")
    end

    it "creates /tmp/index.md" do
      expect(chef_run).to create_cookbook_file("/tmp/index.md")
    end

    it "Update the apt-cache" do
      expect(chef_run).to run_execute("Update the apt-cache")
    end

    it "installs nodejs" do
      expect(chef_run).to install_package("nodejs")
    end

    it "installs daemon" do
      expect(chef_run).to install_package("daemon")
    end

    it "install reveal-md" do
      expect(chef_run).to run_execute("install reveal-md")
    end

    it "enables the nodeserver service" do
      expect(chef_run).to enable_service("nodeserver")
    end

    it "creates /etc/init.d/nodeserver" do
      expect(chef_run).to create_cookbook_file("/etc/init.d/nodeserver")
    end

    it "writes the log note" do
      expect(chef_run).to write_log("Open up http://127.0.0.1:1948/index.md in a web browser and you are in the presentation.")
    end
  end
end
