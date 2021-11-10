# Deploy - Puma

## Pré-requisitos
Para executar o ambiente de produção do projeto Puma é necessário instalar na máquina host as seguintes ferramentas:
- [Docker](https://docs.docker.com/get-docker/) 
- [Docker-Compose](https://docs.docker.com/compose/install/)
- Build essential. Ex: 
		```sudo apt install build-essential```
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Preparando a máquina
O primeiro passo após instalar os pré-requisitos é baixar o repositório de deploy do Puma
[Puma-Deploy](https://github.com/fga-eps-mds/2021-1-PUMA-Deploy)
Basta utilizar o comando git clone para clonar o repositório de deploy.
O projeto puma utiliza as seguintes portas, todas elas precisam estar liberadas na máquina host:
- 80
- 3000
- 3001
- 5432
- 3004
- 8080

Para finalizar o preparo da máquina é necessário criar um arquivo nomeado .env na raiz do repositório de deploy, o formato do arquivo é o seguinte:

DB_URL={{URL de conexão na base}}
DB_USER={{Nome do usuário do banco de dados}}
DB_PASS={{Senha de acesso à base}}
DB={{Nome da base de dados}}
WATCH_TOKEN={{Token de configuração do watchtower}}
DOCKER_HUB={{conta/repositório DockerHub}}

## Executando o projeto
Para executar o projeto, navegue até a pasta raiz do repositório de deploy
``` cd 2021-1-PUMA-Deploy/ ```
Estando na raiz, basta executar o comando:
``` make prod ```, para executar o projeto sem bloquear o terminal
``` make prod-debug ```, para executar o bloqueando o terminal e visualizando os logs
Para finalizar a execução, basta executar o comando:
```make down```

Agora o projeto estará acessível pela porta 80

## Finalizando as configurações
É necessário agora popular a base de dados com as área de conhecimento necessárias, para isso navegue até a pasta dbScripts e execute:
- ```./db_script_test.sh```
Agora o projeto estará pronto para ser utilizado.

## CI/CD
Para CI/CD, utilizamos o [Azure DevOps](https://dev.azure.com/puma-eps/Puma/_build).
Nele está configurado as pipelines de deploy que continuamente atualizam o deploy, sempre que há uma atualização da branch dev.
As pipelines de CD utilizam variáveis de ambiente que precisam ser preenchidas de acordo com a máquina host utilizada, as variáveis de ambiente são compartilhadas entre as pipelines e estão todas na [Library](https://dev.azure.com/puma-eps/Puma/_library?itemType=VariableGroups&view=VariableGroupView&variableGroupId=1&path=Puma%20Prod). Para mudar a máquina host é necessário atualizar a variável EXT_IP com o IP Externo da máquina host.
Além disso, as variáveis possuem informações de acesso a base de dados e Docker Hub, é necessário preencher corretamente todas as variáveis descritas na [Library](https://dev.azure.com/puma-eps/Puma/_library?itemType=VariableGroups&view=VariableGroupView&variableGroupId=1&path=Puma%20Prod).

## Problemas conhecidos
É longe do ideal rodar base de dados em container, isso causa baixa performance em todas as operações do banco de dados e instalibilidade já que containers não são feitos para lidar com estados. Existe o risco de perder a base dados por algum erro de volume no docker, logo recomendo usar uma máquina virtual exclusivamente para a base de dado, fora de container.

Em caso de mudanças na estrutura das tabelas do banco de dados, é necessário excluir a pasta dbdata/. Isso vai fazer com que todos os dados guardados na base sejam excluídos, assim é importante fazer um backup antes. Essa situação só acontece por estar rodando o banco de dados em container.