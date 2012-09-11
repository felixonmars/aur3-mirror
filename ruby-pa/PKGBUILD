# Maintainer: Guten Ye

_gemname=pa
pkgname=ruby-$_gemname
pkgver=1.3.2
pkgrel=1
pkgdesc="a path library for Ruby"
arch=('any')
url="http://github.com/GutenYe/pa"
license=('MIT')
depends=('ruby' 'ruby-pd>=0')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

md5sums=('aac4d02bfdcac9df341906304d5205e0')
