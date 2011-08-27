# Maintainer: TDY <tdy@gmx.com>

pkgname=rubyinline
pkgver=3.8.4
pkgrel=1
pkgdesc="Embed C/++ external module code directly into Ruby code"
arch=('any')
url="http://rubyinline.rubyforge.org/RubyInline/"
license=('MIT')
depends=('ruby')
source=(http://rubyforge.org/frs/download.php/67846/RubyInline-$pkgver.gem
        LICENSE)
md5sums=('682f9138f6cb0393573bf64a5e2b57a6'
         'e2ad1c2a10f61e83e68935a79ff61cad')

build() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" RubyInline-$pkgver.gem || return 1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
