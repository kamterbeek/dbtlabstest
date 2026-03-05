{# if and else #}
{% set temperature = 60.0 %}

On a day like this, I especially like

{% if temperature > 70 %}
a refreshing lemon sorbet
{% else %}
a decadent chocolate cake.
{% endif %}

{# for loops and variables #}

{% for j in range(26) %}
select {{ j }} as number{% if not loop.last %} union all{% endif %}
{% endfor %}
