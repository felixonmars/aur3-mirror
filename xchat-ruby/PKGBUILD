# Contributor: rippero <ripperoso@gmail.com>

pkgname=xchat-ruby
pkgver=1.2
arch=('x86_64 i686')
pkgrel=1
pkgdesc="plugin for xchat scripts to be written in the ruby language"
url="http://xchat-ruby.sourceforge.net"
license=('GPL')
depends=('xchat' 'ruby')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz)
md5sums=('d9a8eafb03c88ac5d8c67b5373f10538')

build() {
  cd $startdir/src/$pkgname-$pkgver-src/src
  cat xchat-ruby-plugin.rb | ruby -pe            \
  'sub(%(get_info\( "xchatdir" \) + "/rubyenv"), \
       %("/usr/lib/xchat/plugins/rubyenv"))'     \
  >xchat-ruby-plugin.rb
  make || return 1
  install -D xchat-ruby.so $startdir/pkg/usr/lib/xchat/plugins/ruby.so
  ruby -e 'puts $LOAD_PATH.join("\n")' >$startdir/pkg/usr/lib/xchat/plugins/rubyenv
}
