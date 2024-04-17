{% macro limit_data_in_dev() %}
{% of target.name === 'development'%}
where {{columnname}} >= dateadd('day', -30, current_timestamp)
{% endif %}
{% endmacro %}