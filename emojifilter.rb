require 'html/pipeline'

context = {
  asset_root: "https://assets.github.com/images/icons/" 
}
mypipeline = HTML::Pipeline.new [
  HTML::Pipeline::MarkdownFilter,
  HTML::Pipeline::EmojiFilter
], context 
result = mypipeline.call "* :cat:"

p result.to_s
