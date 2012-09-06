#
# Cookbook Name:: monit
# Recipe:: default
#

node['monit']['packages'].each do |pkg|
  package pgk do
    action :install
  end
end
