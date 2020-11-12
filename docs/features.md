# Features

## Posts
### Associar posts ao usuário (1 usuário tem vários posts)
- Criar migração para adicionar user_id ao model Post [ ]
- Adicionar relacionamento na factory de Posts [ ]
- Ajustar rota de postagens para usuário atualizar/deletar apenas a própria postagem [ ]
- Ajustar rota de postagens para criar post apenas autenticado [ ]
- Fazer testes para funcionalidades acima [ ]

### Criar funções para model Post
- Criar função para truncar descrição de um post (passando como parâmetro o quanto truncar) [ ]
- Criar função para formatar created_at de um post (formatar data DD/MM/AAAA) [ ]
- Testes para tais funções

### Criar testes para posts
- Fazer teste para checar retorno do request de criar Posts [ ]
- Adicionar 2 contextos para teste de GET /posts/:id [ ]
- Adicionar teste para checar retorno atualizado para request de atualizar Posts [ ]

### Testar rotas de autenticação
- Testar se SignIn/SignUp funciona com parametros corretos (email, senha)
(se retorna os dados do usuário) [ ]
- Testar se impede criar usuario com mesmo email [ ]
- Testar se não encontra usuario caso não exista [ ]
