#
# Cookbook Name:: monit
# Recipe:: default
#

node['monit']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

template ::File.join(node['monit']['etc_dir'], 'monitrc') do
  source 'monitrc.erb'
  mode '0600'
  notifies :restart, "service[monit]", :delayed
end

directory ::File.join(node['monit']['etc_dir'], 'monit', 'conf.d') do
  owner 'root'
  mode '0700'
  recursive true
  action :create
end

service "monit" do
  action [:enable, :start]
  supports [:start, :restart, :stop, :status]
end

