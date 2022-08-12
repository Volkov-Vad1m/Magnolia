[#-- Строчка ниже сообщает скрипту, что кэшировать данные в компоненте не надо. Очень полезно, иначе может не произойти restcall--]
${ctx.response.setHeader("Cache-Control", "no-cache")}
[#-- with a custom value --]

[#-- При добавлении компоненты предлагается ввести имя--]
[#-- Если имя ввели, то выполняется запрос с этим параметром--]
[#if content.name?has_content] 
  <h2>${content.name!}</h2>
  [#assign customValues = {"name": content.name} /] 
  [#-- Создаём переменную, в которой будет лежать прилетевший от запроса json--]
  [#-- restfn.call выполняет rest запрос. Параметры: снача название rest сервеса(имя файла из паки restClients), затем имя метода, затем параметры--]
  [#assign request = restfn.call("rest-test", "greeting", customValues)/] 

  [#else]
  
  [#assign request = restfn.call("rest-test", "greeting")]

  [/#if]

[#-- парсим прилетевший json. В request лежит json. Далее обращаемся просто по названиям из json--]
[#if request?has_content]
<blockquote>
    <p>${request.id.textValue()}</p>
    <cite>${request.content.textValue()}</cite>
</blockquote>

[#else]

<pre>An error occurred. The endpoint may be offline or returns null values.</pre>

[/#if]