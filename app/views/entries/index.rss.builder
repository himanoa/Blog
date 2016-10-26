xml.instruct! :xml, :version => "1.0" 
xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title "ひまのあのブログ"
 
    @entries.each do |post|
      xml.item do
        xml.title post.title
        xml.description text_clamp(post.body_md)
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.guid "http://localhost:3000/entries/#{post.id}"
        xml.link "http://localhost:3000/entries/#{post.id}"
      end
    end
  end
end
