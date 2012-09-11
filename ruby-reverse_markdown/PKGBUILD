# Maintainer: Guten Ye

_gemname=reverse_markdown
pkgname=ruby-$_gemname
pkgver=0.3.0
pkgrel=1
pkgdesc="Transform html code into markdown."
arch=('any')
url="http://github.com/xijo/reverse_markdown"
license=('unkown')
depends=('ruby' 'ruby-nokogiri>=0')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('6d1f550904fec93e4ea09bd97e6a170520f3e4af')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

sha1sums=('6d1f550904fec93e4ea09bd97e6a170520f3e4af')
