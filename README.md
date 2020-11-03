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