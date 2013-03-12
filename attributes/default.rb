default['monit']['packages'] = [ 'monit' ]

default['monit']['poll_period']      = 60
default['monit']['poll_start_delay'] = 60

default['monit']['notify_enabled']   = true
default['monit']['mailserver']       = 'localhost'
default['monit']['notify_email']     = 'notify@example.com'

default['monit']['httpd']['port']    = 2812
default['monit']['httpd']['address'] = "localhost"
default['monit']['httpd']['allows']  = [ 'localhost' ]

default['monit']['mail_format']['from']    = "monit@$HOST"
default['monit']['mail_format']['subject'] = "monit-alert $SERVICE $EVENT"
default['monit']['mail_format']['message'] = <<-EOT
$EVENT Service $SERVICE
     Date:        $DATE
     Action:      $ACTION
     Host:        $HOST
     Description: $DESCRIPTION

Your faithful employee,
Monit
EOT

case node['platform']
when "freebsd"
  default['monit']['etc_dir'] = "/usr/local/etc"
else
  default['monit']['etc_dir'] = "/etc/monit"
end
