FROM composer:2

ENV COMPOSERUSER=laravel
ENV COMPOSERGROUP=laravel

RUN adduser -g ${COMPOSERGROUP} -s /bin/sh -D ${COMPOSERUSER}

# Comando para mantener el contenedor en ejecución
CMD ["tail", "-f", "/dev/null"]