# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=ruby-kindlerb
pkgver=0.0.7
pkgrel=1
pkgdesc="Kindle eperiodical generator"
arch=('any')
url="http://github.com/danchoi/kindlerb"
license=('MIT')
groups=()
depends=('ruby' 'ruby-nokogiri' 'ruby-mustache' 'kindlegen')
makedepends=('ruby')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://gems.rubyforge.org/gems/kindlerb-${pkgver}.gem")
noextract=("kindlerb-${pkgver}.gem")
md5sums=()

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" kindlerb-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
md5sums=('840249e12de7d9012554b6aca57c705a')
