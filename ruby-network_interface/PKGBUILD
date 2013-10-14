# Maintainer: Otto Sabart <seberm[at]gmail[dot]com>

_gemname=network_interface
pkgname=ruby-network_interface
pkgver=0.0.1
pkgrel=1
pkgdesc="programmatically get information on network interfaces"
arch=("any")
url="https://rubygems.org/gems/network_interface"
license=("MIT")
depends=("ruby")
makedepends=("rubygems")
conflicts=("")
options=(!emptydirs)
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  
}

md5sums=('5b1143fba983822c4f7ae5d5964cb252')
