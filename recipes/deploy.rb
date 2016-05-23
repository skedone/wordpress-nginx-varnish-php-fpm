deploy 'wordpress' do
  repo "#{node['wordpress_repository']}"
  user 'root'
  group 'root'
  deploy_to "/var/www/#{node['wordpress_dir']}"
  symlink_before_migrate.clear
  create_dirs_before_symlink.clear
  purge_before_symlink.clear
  symlinks.clear
  action :deploy
end

execute 'php-fpm restart' do
    command 'service php5-fpm restart'
end

execute 'clean varnish cache' do
    command 'varnishadm "ban req.http.host ~ #{node["wordpress_dir"]}"'
end
