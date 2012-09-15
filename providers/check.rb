action :create do
  template ::File.join(node['monit']['etc_dir'], 'monit.d', "#{new_resource.name}.conf") do
    owner 'root'
    mode '0600'
    cookbook new_resource.cookbook if new_resource.cookbook
    source new_resource.source || "#{new_resource.name}.conf.erb"
    action :create
  end
end

action :remote do
  template ::File.join(node['monit']['etc_dir'], 'monit.d', "#{new_resource.name}.conf") do
    action :remove
  end
end
