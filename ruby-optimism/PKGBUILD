# Maintainer: Guten Ye

_gemname=optimism
pkgname=ruby-$_gemname
pkgver=3.3.1
pkgrel=2
pkgdesc="a configuration library for Ruby"
arch=('any')
url="http://github.com/GutenYe/optimism"
license=('MIT')
depends=('ruby' 'ruby-pd>=0' 'ruby-json>=0')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" $_gemname-$pkgver.gem
}

md5sums=('1c7afd2031bcfea29c5e3bfc59cec6e5')
