# This state searches for template definition in pillar
# and processes them

# Search templates and iterate over them
{% for template_name, template_data in salt['pillar.get']('generic_templater:templates', {}).iteritems() %}

# Make sure directory for generated files exists
generic_templater_{{ template_name }}_path:
  file.directory:
    - name: {{ template_data.get('path', '/srv/salt/pillar') }}

  # Search instances and iterate over them
  {% for instance_name, instance_data in pillar.generic_templater[template_name].iteritems() %}

    # Search file to generate
    {% for file in template_data.filelist %}

# Process templates    
{{ template_data.get('path', '/srv/salt/pillar') }}/{{ instance_data.get(file.name_var) }}{{ salt['pillar.get']('generic_templater:config:file_extension', '.yaml') }}:
  file.managed:
    - source: salt://generic-templater/{{ file.template }}
    - context:
      'config': {{ instance_data }}
    - template: jinja  

    {% endfor %}
  {% endfor %}

{% endfor %}
