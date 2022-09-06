# Criando um app template em flutter para implementação e homologação de firebase analytics
===
Autor: `Juan Menezes`
Hoje estou para falar especificamente sobre Flutter, Firebase Analytics e até um pouco da integração disso tudo com o GA4, irei passar rapidamente pela criação de um app que irá testar nossos eventos até a homologação deles e como visualizar isso na nossa propriedade do ga4, antes de mais nada segue a documentação do plugin oficial da google e mantido em conjunto pela comunidade:
[doc](https://pub.dev/documentation/firebase_analytics/latest/firebase_analytics/FirebaseAnalytics-class.html)

Obs.: Caso você já seja mais experiente com tudo isso que eu citei acima e só tem interesse no flutter com firebase você pode pular para o final.

Iremos começar pelo início obviamente que é “mas o que diabos é flutter?”, bom a google tem uma maneira pomposa mas direta de explicar: **“Flutter é o kit de ferramentas de IU do Google para criar aplicativos bonitos e nativamente compilados para dispositivos móveis, web, desktop e incorporados a partir de uma única base de código.”**.

Entrando no campo de qual a principal diferença entre uma coleta em flutter e nativos eu diria que é praticamente nenhuma, diferente de outros tipos de tecnologia cross-plataform do mercado o flutter é mantido pela própria google, com isso trás muitas soluções otimizadas para os serviços da mesma como é o caso do firebase analytics. Sua implementação é muito similar a de nativos, assim como seu desempenho. Sendo assim, a sua principal vantagem é poder usar apenas um código para todas as plataformas.