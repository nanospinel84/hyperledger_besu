cd ..

DIR=$(pwd)

echo
echo "##########################################################"
echo "############### Clonning Besu repository #################"
echo "##########################################################"
echo

#git clone --recursive https://github.com/hyperledger/besu.git

echo
echo "##########################################################"
echo "############### Generating Besu binaries #################"
echo "##########################################################"
echo

cd $DIR/besu

#./gradlew build -x test

cd build/distributions/

filename=$(ls | grep .tar.gz)

basename=$filename
while [[ $basename = ?*.* && ( ${basename##*.} = [A-Za-z]* || ${basename##*.} = 7z ) ]]
do
  #ext=${basename##*.}.$ext
  basename=${basename%.*}
done
#ext=${ext%.} 

besu_folder=`echo $basename | cut -d - -f1-2`

#tar -xzf $filename

#mkdir $DIR/besu-net

#cp -R $basename $DIR/besu-net/$besu_folder

echo
echo "##########################################################"
echo "################# Downloading Ethsinger ##################"
echo "##########################################################"
echo

cd $DIR/besu-net

#curl -L -o ethsigner-0.7.2.tar.gz 'https://bintray.com/consensys/pegasys-repo/download_file?file_path=ethsigner-0.7.2-SNAPSHOT.tar.gz'

#tar -xzf ethsigner-0.7.2.tar.gz


echo
echo "##########################################################"
echo "############## Creating folder structure #################"
echo "##########################################################"
echo

#mkdir node_1
#mkdir node_2
#mkdir node_3
#mkdir account_1
#mkdir account_2

echo "################ folder structure created ################"

echo
echo "##########################################################"
echo "################## Initializing Nodes ####################"
echo "##########################################################"
echo

echo "############# Address generation for node_1 ###############"
echo

cd $DIR/besu-net/node_1

#$DIR/besu-net/$besu_folder/bin/besu --data-path=$DIR/besu-net/node_1/data public-key export-address --to=$DIR/besu-net/node_1/data/node_1_address

#node_1_address=$(cat $DIR/besu-net/node_1/data/node_1_address)

#node_1_address="${node_1_address:2}"

#echo "node_1 address: $node_1_address"

#sed "s/NODE_1_ADDRESS/$node_1_address/g" "$DIR/config/genesis_template.json" > "$DIR/besu-net/genesis.json"

#cp $DIR/config/config.toml $DIR/besu-net/node_1

$DIR/besu-net/$besu_folder/bin/besu --config-file=$DIR/besu-net/node_1/config.toml --bootnodes
