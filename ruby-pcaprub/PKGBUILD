# Maintainer: Otto Sabart <seberm[at]gmail[dot]com>

_gemname=pcaprub
pkgname=ruby-pcaprub
pkgver=0.11.3
pkgrel=1
pkgdesc="libpcap bindings for ruby compat with JRUBY Ruby1.8 Ruby1.9"
arch=("any")
url="https://rubygems.org/gems/pcaprub"
license=("GPL")
depends=("ruby" "libpcap")
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

md5sums=('2db3d5a25c84f99440531cfc028a40da')
