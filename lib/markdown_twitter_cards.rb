require "markdown_twitter_cards/version"
require "nokogiri"

module MarkdownTwitterCards
  # Your code goes here...
  # class Markdown
  # end
  def self.get_meta(text)
    doc=::Nokogiri::HTML(text)
    card = doc.xpath("//meta[@name='twitter:card']/@value").first || doc.xpath("//meta[@name='twitter:card']/@content").first
    return nil unless card
    card = card.value
    player = doc.xpath("//meta[@name='twitter:player']/@value").first || doc.xpath("//meta[@name='twitter:player']/@content").first
    player = player.value if player

    image = doc.xpath("//meta[@name='twitter:image']/@value").first || doc.xpath("//meta[@name='twitter:image']/@content").first || doc.xpath("//meta[@name='og:image']/@content").first
    image = image.value if image

    url = doc.xpath("//meta[@name='twitter:url']/@value").first || doc.xpath("//meta[@name='twitter:url']/@content").first || doc.xpath("//meta[@name='og:url']/@content").first
    url = url.value if url

    title = doc.xpath("//meta[@name='twitter:title']/@value").first || doc.xpath("//meta[@name='twitter:title']/@content").first || doc.xpath("//meta[@name='og:title']/@title").first
    title = title.value if title

    description = doc.xpath("//meta[@name='twitter:description']/@value").first || doc.xpath("//meta[@name='twitter:description']/@content").first || doc.xpath("//meta[@name='og:description']/@content").first
    description = description.value if description

    {:card => card, :player => player, :image => image, :url => url, :title => title,
      :description => description} 
  end
  def self.get_embed(url)
    open(url) {|f|
      get_meta(f.read)
      #f.read
    }
  end
  def self.embed(text)
    card = get_embed(text)
    "<iframe src=\"#{card[:player]}\">"
  end
  def self.embed(text)
    doc=::Nokogiri::HTML(text)
    card = doc.xpath("//meta[@name='twitter:card']/@value").first
    return nil unless card
    card = card.value
    player = doc.xpath("//meta[@name='twitter:player']/@value").first
    player = player.value if player
    image = doc.xpath("//meta[@name='twitter:image']/@value").first
    image = image.value if image
    {:card => card, :player => player, :image => image}
    #{:iframe => attr.value,:no_iframe => ''}
    #
  end
end
