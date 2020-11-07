# Starter Project com API de autenticação

## Como configurar ambiente massa de testes
Todas as gemas adicionadas e suas configurações estão presentes nesse projeto, caso precise de uma referência de onde instalar cada coisa.
### Adicionar RSPEC
Framework de testes para Ruby

[Instruções atualizdas rspec](https://github.com/rspec/rspec-rails)

adicione no gem file no parte de :development e :test

```gem 'rspec-rails', '~> 4.0.1'```

rode 

````bundle install````

por fim, rode o comando:

```rails generate rspec:install```

### Adicionar Factory Bot
FactoryBot é uma gema que permite instanciar Models para testes de maneira
facilitada, o que nos ajuda muito a fazer testes mais consistentes de forma mais rápida.

[Instruções atualizdas factory-bot](https://github.com/thoughtbot/factory_bot_rails)

adicione no gem file no parte de :development e :test

```gem 'factory_bot_rails'```

rode 

````bundle install````

por fim, adicione o seguinte ao rails_helper.rb dentro do bloco Rspec.configure:

``` config.include FactoryBot::Syntax::Methods```

### Adicionar Simple Cov
SimpleCov nos permite ver a cobertura de testes, para ver mais
facilmente onde é preciso testar.

[Instruções atualizdas simple cov](https://github.com/simplecov-ruby/simplecov)

adicione no gem file no parte de :test

```gem 'simplecov', require: false```

rode 

````bundle install````

por fim, adicione o seguinte ao spec_helper.rb bem no topo do arquivo:

```
require 'simplecov'
SimpleCov.start
```

## Como usar a API de autenticação
Você pode importar os requests do POSTMAN com o seguinte link:

https://www.getpostman.com/collections/b7b2dd1f1ba502e64b47

Basta ir no menu "import" do postman:

![menu do postman](https://i.imgur.com/krjw3d8.png)

Ir na aba "", adicionar a url acima e clicar em "import":

![menu de import](https://i.imgur.com/lU3q15M.png)

Todas as requisições devem aparecer no seu Postman:

![requisicoes no postman](https://i.imgur.com/qi9SrYx.png)

Note que para usar elas, uma variável {{url}} deve estar setada.
Isso pode ser feito importando um enviroment no postman:

Baixe o arquivo json do development enviroment do postman:

[Link para Development Enviroment](https://pastebin.com/LGmBZeHQ)

Importe ele no postman pelo menu de "import":
![menu do postman](https://i.imgur.com/krjw3d8.png)

Coloque o arquivo JSON baixado para importar:
![menu import arquivo](https://i.imgur.com/DgOrMTN.png)

Você pode ver agora o ambiente de development no menu lateral, podendo mudar a variável
{{url}} e a {{token}} conforme necessário:

![menu enviroment](https://i.imgur.com/m4MMnN6.png)

### Requisições autenticado:

Para fazer uma requisição autenticado é preciso passar 3 parâmetros no header da requisição
para que a API encontre o usuário atual:
- client
- access-token
- uid

![exemplo de requisicao autenticada](https://i.imgur.com/nEJayy5.png)

Esses dados vêm da requisição de sign_in (ou sign_up), na parte de headers da resposta:

![postman headers](https://i.imgur.com/gpoZCNG.png)