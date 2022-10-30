#$###----####---####----/////----#####----$
# MONTAGEM DE DISCO RIGIDO - PARA BACKUP  #
#$###----####---###-----/////----#####----$
apt install figlet -y
clear

figlet "MONTAGEM DE HD - BACKUP"
echo "by 0c3x"
echo
sleep 2
# LISTAGEM DE DISCOS
fdisk -l
echo
echo
# CRIANDO PARTICAO NO DISCO // HABILITAR
echo " Digite o nome o caminho do disco a ser criado..."
read LOC_DISCO_1
cfdisk $LOC_DISCO_1
echo
echo
sleep 2
clear
echo "################################"
echo "Visualizando novo caminho criado"
echo "################################"
fdisk -l
echo
echo
# ATRIBUINDO FORMATO EXT3 PARA O DISCO
echo "Digite o novo caminho criado..."
read LOC_DISCO_2
mkfs.ext3 $LOC_DISCO_2
echo
echo
sleep 2
clear
echo "################################################"
echo "Visualizando ARQUIVOS MONTADOS NO DIRETORIO /MNT"
echo "################################################"
ls -la /mnt/
echo
echo
echo "Digite a nome da pasta a ser criada. Ex: backup-01..."
read pasta_bkp
mkdir /mnt/$pasta_bkp
echo
echo
echo "Montando o armazenamento em /mnt/$pasta_bkp/"
mount -t ext3 $LOC_DISCO_2 /mnt/$pasta_bkp/
echo "[+]DISCO MONTANDO COM SUCESSO!"
