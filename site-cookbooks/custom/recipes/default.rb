# CUSTOM STUFF GOES HERE

# hostname
file '/etc/hostname' do
  content "#{node[:custom][:hostname]}\n"
end

service 'hostname' do
  action :restart
end

file '/etc/hosts' do
  content "127.0.0.1 localhost #{node[:custom][:hostname]}\n"
end

# configure firewall
firewall "ufw" do
  action :enable
end

firewall_rule "ssh" do
  port 22
  action :allow
end

firewall_rule "http/https" do
  protocol :tcp
  ports [ 80, 443 ]
  action :allow
end