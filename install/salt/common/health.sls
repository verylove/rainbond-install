health-check-rsync:
  file.recurse:
    - source: salt://install/files/health
    - name: {{ pillar['rbd-path'] }}/health/
    - template: jinja
    - file_mode: 777