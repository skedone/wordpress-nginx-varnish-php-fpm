log "Domain name: #{node['domain']}"
log "Domain www_name: #{node['www_domain']}"

template '/etc/default/varnish' do
	source 'varnish.config.erb'
	owner 'root'
	group 'root'
	mode '0644'
end

template '/etc/varnish/default.vcl' do
	source 'varnish.default.erb'
	owner 'root'
	group 'root'
	mode '0644'
end

log "Successfully configure Varnish 4"

directory '/var/www' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/var/www/nginx.conf' do
	source 'nginx.w3totalcache.erb'
	owner 'root'
	group 'root'
	mode '0644'
end

template '/etc/nginx/sites-available/default' do
	source 'nginx.vhost.erb'
	owner 'root'
	group 'root'
	mode '0644'
end

service 'nginx' do
  action :restart
end

service 'varnish' do
  action :restart
end

log "Successfully configure NGINX"