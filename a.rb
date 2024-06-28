# coding: utf-8
require "css_parser"
include CssParser

parser = CssParser::Parser.new
parser.load_file!("nerd-fonts-generated.css")

puts "{"
# すべてのセレクタを列挙
parser.each_selector do |selector, declarations, specificity|
  if selector.start_with?(".fa-") and selector.end_with?(":before")
    # アイコンの名前を取り出す
    selector[/¥.fa-([a-z0-9¥-]+):before/]
    icon_name = $‾[1]

    # content 属性の値を取り出す
    declarations[/content: "¥¥([a-z0-9]+)"/]
    icon_value = "0x#{$‾[1]}"

    # ハッシュ形式で出力
    puts "  ¥"#{icon_name}¥" => #{icon_value},"
  end
end
puts "}"
