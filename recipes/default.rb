#
# Cookbook Name:: env
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# groupinstall "Development Tools"
bash "Install Development Tools" do
  user "root"
  code <<-EOH
  yum groupinstall -y "Development Tools"
  EOH
end

# update ntp
bash "Update ntp" do
  user "root"
  code <<-EOH
  ntpdate ntp.nict.jp
  cat /usr/share/zoneinfo/Asia/Tokyo > /etc/localtime
  EOH
end

# install git, zsh, emacs and tmux
%w{git zsh emacs tmux}.each do |pkg|
  package pkg do
    action :install
  end
end

# Set default shell to zsh (if not be password)
bash "Set vagrant's shell to zsh" do
  code <<-EOT
    chsh -s /bin/zsh #{node["user"]["name"]}
  EOT
  not_if 'test "/bin/zsh" = "$(grep #{node["user"]["name"]} /etc/passwd | cut -d: -f7)"'
end

# zshrc setting
# for default user
template "zshrc" do
  path    "/home/#{node["user"]["name"]}/.zshrc"
  source  "zshrc.erb"
  owner   "#{node["user"]["name"]}"
  group   "#{node["user"]["name"]}"
  mode    0640
end
## for root user
template "zshrc4root" do
  path    "/root/.zshrc"
  source  "zshrc.erb"
  owner   "root"
  group   "root"
  mode    0640
end
