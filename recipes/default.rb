#
# Cookbook Name:: monit
# Recipe:: default
#

node['monit']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end
