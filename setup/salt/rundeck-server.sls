openjdk-7-jdk:
  pkg:
    - installed

download-rundeck:
  file.managed:
    - name : /tmp/rundeck-2.6.1-1-GA.deb
    - source : http://dl.bintray.com/rundeck/rundeck-deb/rundeck-2.6.1-1-GA.deb
    - source_hash : sha1=39ee3b573185b9cedd57f838dd38c96104f8d184

install-rundeck:
  cmd.run:
    - name : dpkg -i /tmp/rundeck-2.6.1-1-GA.deb
    - require :
        - file: download-rundeck

jq:
  pkg:
    - installed

