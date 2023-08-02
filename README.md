# ProjetoDjangoProcessoSeletivo
Este projeto foi realizado com o intuito de ser submetido para um processo seletivo. Ele utiliza interação do framework django com chartJs, bootstrap, css, html, MySql e algumas outras funcionalidades.
Aqui neste diretório está anexado a pasta do projeto e o banco de dados MySQL. Neste desafio, eu utilizei o phpmyadmin (xampp) para realizar as interações com o banco de dados, entretanto, eu extraí o bd como arquivo sql, podendo ser importado para qualquer software de sua preferência. Para fazer com que a interação funcione, é necessário alterar os valores da variável DATABASE, dentro do arquivo settings, na pasta SistemaEmpresa; estes valores irão ser fundamentais para que a conexão com o banco de dados ocorra sem problemas. Ou seja, os dados atuais estão como: 
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'BancoEmpresa',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}

Assim, para que o sistema consiga acessar o banco de dados no seu localhost, talvez você precise alterar a variável PASSWORD, pois o seu localhost pode haver certas exigências. Em relação as outras variáveis, é pouco provável que haja necessidade de alterá-las.

INSTRUÇÕES:
Para iniciar o servidor, ou seja, começar o projeto, é necessário ter o banco de dados ativo (importar o arquivo sql para o seu localhost, como o xampp, por exemplo), além de utilizar algum tipo de terminal, como o do cmd. Após ter aberto o terminal, é necessário verificar se o caminho atual está dentro de Processo_Seletivo_JobConvo; ou seja, se a pasta Processo_Seletivo_JobConvo está na pasta C:\Users\Familia, você deve fazer com que o terminal esteja no caminho C:\Users\Familia\Processo_Seletivo_JobConvo.
Além disso, existe um arquivo REQUIREMENTS.TXT, que carrega consigo todas as exigências e pacotes para o projeto, seja as versões dos frameworks ou pacotes, logo, esteja atento se todos os requisitos estão devidamente cumpridos.
Após isso, basta utilizar o comando "python manage.py runserver" no terminal. Com isso, o servidor interno já deve estar funcionando e a aplicação rodando sem problemas.
/*/*/*/*/*/*/*/*/*/*/*/*//*/*/*/*/*/*/*/*/*/*/*/*//*/*/*/*/*/*/*/*/*/*/*/*//*/*/*/*/*/*/*/*/*/*/*/*//*/*/*/*/*/*/*/*/*/*/*/*/
Abordando a lógica do sistema, é necessário explicar como o banco de dados está estruturado. Ele possui 4 tabelas: Empresa, candidato, vaga e vaga_candidato.
A tabela empresa irá abrigar todas as empresas cadastradas no sistema; ou seja, este sistema foi pensado na possibilidade de um conglomerado utilizá-lo, pois, ao se ter diferentes empresas, é necessário que o sistema esteja adaptado para cruds com dados específicos para cada uma. Para criar uma nova empresa, é necessário acessar o /admin/, e logar com o SuperUser -> usuário: SuperUser; senha: PassOrd*927. Assim, é possível criar uma nova empresa.
A tabela candidato e vaga possuem as informações necessárias para cada uma, entretanto, a tabela vaga_candidato carrega consigo a informação de quais candidatos se candidataram em quais vagas, além da pontuação que os candidatos teriam sobre cada vaga.
Agora, entendendo a funcionalidade do banco de dados, basta utilizar o sistema. É possível criar e logar com usuários, entretanto, só é possível logar com empresas. Isto foi pensado pois seria uma falha de lógica se qualquer usuário pudesse criar uma empresa. A empresa registrada no sistema possui os dados -> email: no-reply@jobConvoDominio.com.br; senha: 123. Com isto, é possível acessar todas as funcionalidades do sistema. 
Gostaria de agradecer desde já pela oportunidade de estar participando deste processo, e espero que consiga suprir as expectativas que são esperadas de mim.
