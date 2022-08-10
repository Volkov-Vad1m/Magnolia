${ctx.response.setHeader("Cache-Control", "no-cache")}
[#-- with a custom value --]

[#if content.name?has_content]
  <h2>${content.name!}</h2>
  [#assign customValues = {"name": content.name} /] 
  [#assign request = restfn.call("rest-test", "greeting", customValues)/] 

  [#else]
  
  [#assign request = restfn.call("rest-test", "greeting")]

  [/#if]

[#if request?has_content]
<blockquote>
    <p>${request.id.textValue()}</p>
    <cite>${request.content.textValue()}</cite>
</blockquote>

[#else]

<pre>An error occurred. The endpoint may be offline or returns null values.</pre>

[/#if]