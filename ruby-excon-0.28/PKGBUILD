# Maintainer: Bertrand Bonnefoy-Claudet <bertrandbc@gmail.com>

_gemname=excon
pkgname=ruby-${_gemname}-0.28
pkgver=0.28.0
pkgrel=1
pkgdesc="speed, persistence, http(s)"
arch=('any')
url="https://github.com/geemus/excon"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('c34d67ea7caf107e7cad0b6d6f6e6d8f')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

