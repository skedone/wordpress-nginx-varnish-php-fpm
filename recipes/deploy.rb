deploy 'wordpress' do
  repo 'https://github.com/WordPress/WordPress.git'
  user 'root'
  group 'root'
  deploy_to "/var/www/#{node['domain']}"
  symlink_before_migrate.clear
  create_dirs_before_symlink.clear
  purge_before_symlink.clear
  symlinks.clear
  action :deploy
end

execute 'php-fpm restart' do 
	command 'service php5-fpm restart'
end