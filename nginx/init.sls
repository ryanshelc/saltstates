/root/opsgadget/logs:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 655

nginx:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-enabled/appnginxconfig.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/nginx.conf
    - user: root
    - group: root
    - mode: 644

/etc/nginx/sites-enabled/appnginxconfig.conf:
  file.managed:
    - source: salt://nginx/appnginxconfig.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja