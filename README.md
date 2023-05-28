# Deploy Templates

## Objetivo:
Armazenar serviços docker que podem ser úteis no processo de deploy da aplicação utilizando a estrutura de arquivos
criadas a partir do shell script

## Estrutura:
    -> main
         nginx/
             default.conf # nginx config
         .env
         docker-compose.yml
    -> app
        front
            nginx/
                default.conf
            docker-compose.yml
            .env
        back
            nginx/
                default.conf
            docker-compose.yml
            .env
## Diferencial

O diferencial de usar essa estrutura juntamente com esses serviços é que nos poupa muita das configurações
    
1. usando o serviço nginx-proxy basta subir um container nginx com o virtual host que será altomaticamente inserido no
pool de hosts da maquina, sendo capaz de ter N hosts na mesma máquina
2. usando o servico nginx-acne será gerado automaticamente um certificado https para cada host dado pelos container nginx
3. usando o serviço watchtower toda vez que a imagem do container especificado ser atualizado no registry ele altomaticamente
faz pull da imagem e atualiza o container para a nova versão da imagem