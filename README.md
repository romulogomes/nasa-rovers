# NasaRovers

Para resolver o problema proposto, criei uma API que possui um end-point que recebe o arquivo de texto como paramêtro. Para facilitar os testes, fiz o deploy da API na heroku e compartilhei no link abaixo a request já preparada, devendo ser colocado somente o arquivo de teste no menu * *body->form_data->value da chave 'file'*
[Request Link](https://www.postman.com/sitisolucoes/workspace/nasarovers/request/3176468-9a3f7775-3f1d-4dd3-9f3e-184e7b2b9699)

ou se preferir, executar teste com *curl*:
 
 ```
curl --location --request POST 'http://nasa-rover.herokuapp.com/run_rovers' \
--form 'file=@"CAMINHO_DO_ARQUIVO_DE_TESTES"'
 ```

A aplicação conta com [teste unitário](https://github.com/romulogomes/nasa-rovers/blob/main/spec/models/rover_spec.rb) e [teste de integração](https://github.com/romulogomes/nasa-rovers/blob/main/spec/requests/project_spec.rb)

Apesar de não ter testes para todos os cenários, 100% das linhas estão cobertas.
![100% de cobertura](https://i.ibb.co/b2yNXkM/Captura-de-tela-de-2022-07-04-20-52-59.png)