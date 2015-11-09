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

log "Successfully installed"