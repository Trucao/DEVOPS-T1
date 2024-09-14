# DEVOPS-T1
Trabalho de devops etapa 1

Joao Ricardo Lopes Lovato

Guilherme Silva Castro

O projeto consiste em uma aplicação composta por quatro containers: três essenciais (frontend, backend e banco de dados) e um de gerenciamento (phpMyAdmin, utilizado opcionalmente para acessar o banco de dados). O frontend se comunica com o banco de dados por meio do backend, exibindo uma lista de tarefas (todo list) armazenada no banco, desde que todas as conexões estejam configuradas corretamente.

Nesta etapa, o objetivo foi garantir que a aplicação fosse executada em um cluster Kubernetes. Para isso, as imagens criadas na fase anterior foram enviadas para o Docker Hub, e os arquivos de deployment para cada contêiner foram gerados (localizados na pasta ./DEVOPS-T1/cluster), juntamente com os arquivos YAML que definem os respectivos serviços. Nessa mesma pasta, também está incluído o arquivo de configuração do Ingress, que permite o acesso à aplicação por meio da URL k8s.local.

Na raiz do projeto, há um script chamado minikube-up.sh, que automatiza a criação do cluster e a implantação da aplicação.

Importante a instalação do docker e do minikube para rodar o projeto.

imagens localizadas em:https://hub.docker.com/repository/docker/truconses/t2/general
