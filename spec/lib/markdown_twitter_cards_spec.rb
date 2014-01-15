# -*- coding: utf-8 -*-
require 'markdown_twitter_cards'
require 'open-uri'

describe MarkdownTwitterCards, "when empty" do
  before do
    @empty_array = []
  end
  it "should size 0" do
    expect(MarkdownTwitterCards.get_meta("a")).to eq(nil)
  end
  it "should size 0" do
    html = <<EOS
<!-- fb open graph meta tags -->
<meta name="fb_app_id" property="fb:app_id" class="fb_og_meta" content="2490221586" />
<meta name="og_type" property="og:type" class="fb_og_meta" content="slideshare:presentation" />
<meta name="og_url" property="og:url" class="fb_og_meta" content="http://www.slideshare.net/uk-ar/uk-ar-
<meta name="og_image" property="og:image" class="fb_og_meta" content="http://cdn.slidesharecdn.com/ss_th
<!-- SL:start:notranslate -->
<meta name="og_title" property="og:title" class="fb_og_meta" content="Uk ar" />
<meta name="og_description" property="og:description" class="fb_og_meta" content="東京のメーカーでソフト
<!-- SL:end:notranslate -->
<!-- SL:start:notranslate -->
<meta name="twitter:card" value="player" />
<meta name="twitter:site" value="@slideshare" />
<meta name="twitter:player" class="twitter_player" value="https://www.slideshare.net/slideshow/embed_cod
<meta name="twitter:player:width" value="342" />
<meta name="twitter:player:height" value="291" />
<meta name="twitter:title" class="twitter_title" value="Uk ar" />
<meta name="twitter:image" class="twitter_image" value="http://cdn.slidesharecdn.com/ss_thumbnails/ukar-
<!-- SL:end:notranslate -->
EOS
    expect(MarkdownTwitterCards.get_meta(html)).to eq(nil)
  end 
  it "slide share" do
    expect(MarkdownTwitterCards.get_embed("http://www.slideshare.net/uk-ar/uk-ar-12939781")).to eq({:card=>"player", :player=>"https://www.slideshare.net/slideshow/embed_code/12939781", :image=>"http://cdn.slidesharecdn.com/ss_thumbnails/ukar-120515073153-phpapp01-thumbnail-4.jpg?cb=1337085146", :url=>nil, :title=>"Uk ar", :description=>nil})
  end
  # it "embed slideshare" do
  #   expect(MarkdownTwitterCards.embed("http://www.slideshare.net/uk-ar/uk-ar-12939781")).to eq({:card=>"player", :player=>"https://www.slideshare.net/slideshow/embed_code/12939781", :image=>"http://cdn.slidesharecdn.com/ss_thumbnails/ukar-120515073153-phpapp01-thumbnail-4.jpg?cb=1337085146", :url=>nil, :title=>"Uk ar", :description=>nil})
  # #<iframe src="http://www.slideshare.net/slideshow/embed_code/12939781" width="427" height="356" frameb
  # end
  #"<iframe src=\"${card[:player]}\">"
  it "vimeo" do
    expect(MarkdownTwitterCards.get_embed('http://vimeo.com/39530265')).to eq({:card=>"player", :player=>"https://player.vimeo.com/video/39530265", :image=>nil, :url=>nil, :title=>nil, :description=>nil})
  end
  it "tumblr" do
    expect(MarkdownTwitterCards.get_embed('http://ukar.tumblr.com/post/72897673197')).to eq({:card=>"summary", :player=>nil, :image=>"http://assets.tumblr.com/images/facebook_og_quote.png?1338", :url=>"http://ukar.tumblr.com/post/72897673197", :title=>"Quote", :description=>"“シェアボタンはサービス拡大の要です、気を抜かないようにしましょう。 ブログ、メディア、個人サイトを問わずいいねボタンやツイートボタンを設置するのはごく当たり前になっています。そんな中にあっては予め用意されているものを単に貼付けるだけでは目立たなくなっています。 多少なりとも工夫をしてみることをお勧めします。今回はサービスの選択が可能なソーシャルボタンビルダー、Social...”"})
  end
  it "twitter" do
  end
  it "amazon" do
    expect(MarkdownTwitterCards.get_embed('http://www.amazon.co.jp/gp/product/4774161209/')).to eq(nil)
  end
  # it "hatena" do
  #   expect(MarkdownTwitterCards.get_embed('http://uk-ar.hatenablog.com/entry/2014/01/15/124107')).to eq(nil)
  # end
end
