#!/bin/bash

# USUARIO c/ permissão root deve executar essa tarefas.
USUARIO_PUBKEY=$1
USUARIO_PRIVKEY=$2
USER_DEST=$3
HOST_DEST=$4
CAM_DEST=$5
SERVICO=$6

ARQUIVO=www-$SERVICO-$(date +%Y%m%d-%H%M%S).tar.gz

# COMPACTACAO DO ARQUIVO #
echo "compactando"
tar -zcvf /home/backup/$ARQUIVO /var/www/
echo
# ENCRIPTACAO DOS DADOS #
echo "Encriptando..."
gpg -e -u $USUARIO_PUBKEY -r $USUARIO_PRIVKEY /home/backup/$ARQUIVO
echo
# ENVIO DOS DADOS #
echo "Enviando arquivos..."
rsync -av /home/backup/$ARQUIVO.gpg $USER_DEST@$HOST_DEST:$CAM_DEST
