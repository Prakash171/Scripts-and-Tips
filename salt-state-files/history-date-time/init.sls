/etc/profile.d:
  file.recurse:
    - source: salt://history-date-time/profile.d/
    - user: root
    - group: root
