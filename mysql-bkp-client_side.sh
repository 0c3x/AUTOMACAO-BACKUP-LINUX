#!/bin/bash

# USUARIO c/ permissão root deve executar essa tarefas.
USUARIO_PUBKEY=$1
USUARIO_PRIVKEY=$2
USER_DEST=$3
HOST_DEST=$4
CAM_DEST=$5
SERVICO=$6

# NOMES #
ARQ_MYSQL=mysql-$SERVICO-$(date +%Y%m%d-%H%M%S).sql
ARQUIVO=mysql-$SERVICO-$(date +%Y%m%d-%H%M%S).sql.tar.gz

# GERANDO ARQUIVO-SQL #
mysqldump --all-databases -u root > /home/backup/$ARQ_MYSQL
# COMPACTACAO DO ARQUIVO #
echo "compactando"
tar -zcvf /home/backup/$ARQUIVO /home/backup/$ARQ_MYSQL
rm /home/backup/$ARQ_MYSQL
echo
# ENCRIPTACAO DOS DADOS #
echo "Encriptando..."
gpg -e -u $USUARIO_PUBKEY -r $USUARIO_PRIVKEY /home/backup/$ARQUIVO
echo
# ENVIO DOS DADOS #
echo "Enviando arquivos..."
rsync -av /home/backup/$ARQUIVO.gpg $USER_DEST@$HOST_DEST:$CAM_DEST
