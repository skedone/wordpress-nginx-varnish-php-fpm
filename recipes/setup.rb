package "curl"

execute "add-varnish" do
	command "curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -"
end

execute "add-varnish-repository" do
	command 'echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list'
end

execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
end

package "nginx"
package "varnish"
package "php5-fpm"
package "php5-mysqlnd"
package "php5-apcu"
package "php5-curl"
package "git"

log "Successfully setup."