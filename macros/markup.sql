{% macro markup(sellingprice, costprice) %}
({{sellingprice}} - {{costprice}})/{{costprice}}
{% endmacro %}

--test test for git