package "rsyslog"

case node['platform']
when 'ubuntu'
  package "auditd"

  cookbook_file "/etc/audit/auditd.conf" do
    source "auditd.conf"
  end
when  'centos'
  package %w(audit audit-libs)

  service 'auditd' do
    action [:enable, :start]
  end
end
