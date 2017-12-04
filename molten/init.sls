# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "molten/map.jinja" import molten with context %}

molten-archive:
  archive.extracted:
    - name: {{ molten.install_dir}}
    - source: https://github.com/martinhoefling/molten/releases/download/v{{ molten.package.version }}/molten-{{ molten.package.version }}.tar.gz
    - source_hash: sha1={{ molten.package.sha1 }}
    - archive_format: tar
    - options: v
    - if_missing: {{ molten.install_dir }}/{{ molten.package.version }}/

molten-symlink:
  file.symlink:
    - name: {{ molten.install_dir }}/molten
    - target: {{ molten.install_dir }}/molten-{{ molten.package.version }}
