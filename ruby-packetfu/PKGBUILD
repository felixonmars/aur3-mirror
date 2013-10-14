# Maintainer: Otto Sabart <seberm[at]gmail[dot]com>

_gemname=packetfu
pkgname=ruby-packetfu
pkgver=1.1.9
pkgrel=1
pkgdesc="mid-level packet manipulation library - for reading, parsing and writing network packets with the level of ease"
arch=("any")
url="https://github.com/todb/packetfu"
license=("GPL")
depends=("ruby" "ruby-pcaprub")
makedepends=("rubygems" "postgresql-libs")
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

md5sums=('5734cf7240380c9acff31e202f262192')
