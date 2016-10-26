script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
echo $script_dir

curl https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.4.1/elasticsearch-2.4.1.tar.gz > ${script_dir}/elasticsearch.tar.gz

tar xfvz elasticsearch.tar.gz
