require 'html/pipeline'

context = {
  :asset_root => "/Users/himanoa/src/github.com/AC3ROZ/Blog/public/images/emoji/unicode",
}
mypipeline = HTML::Pipeline.new [
  HTML::Pipeline::MarkdownFilter,
  HTML::Pipeline::EmojiFilter
], context 
result = mypipeline.call ":cat:"

p result[:output].to_s
