[#-- Строчка ниже сообщает скрипту, что кэшировать данные в компоненте не надо. Очень полезно, иначе может не произойти restcall--]
${ctx.response.setHeader("Cache-Control", "no-cache")}
[#-- with a custom value --]

[#-- При добавлении компоненты предлагается ввести имя--]
[#-- Если имя ввели, то выполняется запрос с этим параметром--]
[#if content.id?has_content] 
  <h2>Вы ввели id: ${content.id!}</h2>
  [#assign customValues = {"id": content.id} /] 
  [#-- Создаём переменную, в которой будет лежать прилетевший от запроса json--]
  [#-- restfn.call выполняет rest запрос. Параметры: снача название rest сервеса(имя файла из паки restClients), затем имя метода, затем параметры--]
  [#assign request = restfn.call("demo-rest", "read", customValues)/] 

  [#else]
  
  [#assign request = restfn.call("demo-rest", "read")]

  [/#if]

[#-- парсим прилетевший json. В request лежит json. Далее обращаемся просто по названиям из json--]
[#if request?has_content]
    <h3>Ответ от get:</h3>
{<br>
    <code>&nbsp;id: ${request.id}</code> <br>
    <code>&nbsp;name: ${request.name.textValue()}</code> <br>
    <code>&nbsp;email: ${request.email.textValue()}</code> <br>
}
[#else]

<pre>ERROR</pre>

[/#if]