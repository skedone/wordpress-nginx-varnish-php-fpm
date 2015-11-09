

service 'php5-fpm' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end