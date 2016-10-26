script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

curl https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.4.1/elasticsearch-2.4.1.tar.gz > ${script_dir}/elasticsearch.tar.gz

tar xfvz ${script_dir}/elasticsearch.tar.gz

${script_dir}/elasticsearch-2.4.1/bin/plugin install analysis-kuromoji

sed -i -e "92i index.analysis.analyzer.default.type: custom" ${script_dir}/elasticsearch-2.4.1/config/elasticsearch.yml
sed -i -e "93i index.analysis.analyzer.default.tokenizer: kuromoji_tokenizer" ${script_dir}/elasticsearch-2.4.1/config/elasticsearch.yml

echo "Entry.import force: true" | bundle exec rails c
