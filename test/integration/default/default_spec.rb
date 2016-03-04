# encoding: utf-8
# author: JJ Asghar

describe package("daemon") do
  it { should be_installed }
end

describe port(1948) do
  it { should be_listening }
  its("protocols") { should include "tcp" }
end

describe service("nodeserver") do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe file("/tmp/reveal.json") do
  it { should be_file }
end

describe file("/tmp/index.md") do
  it { should be_file }
end

describe file("/etc/init.d/nodeserver") do
  it { should be_file }
end
