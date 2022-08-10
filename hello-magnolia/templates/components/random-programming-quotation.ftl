${ctx.response.setHeader("Cache-Control", "no-cache")}
[#assign randomQuote = restfn.call("programming-quotations", "random")]

[#if randomQuote?has_content]

<blockquote>
    <p>${randomQuote.id.textValue()}</p>
    <cite>${randomQuote.author.textValue()}</cite>
</blockquote>

[#else]

<pre>An error occurred. The endpoint may be offline or returns null values.</pre>

[/#if]