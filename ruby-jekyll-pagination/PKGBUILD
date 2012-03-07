# Maintainer: snyh<snyh@snyh.org>
pkgname=ruby-jekyll-pagination
pkgver=0.0.4
pkgrel=1
pkgdesc="Jekyll plugin to extend the pagination generator."
arch=('any')
url="http://github.com/blackwinter/jekyll-pagination"
license=()
groups=()
depends=()
makedepends=('ruby')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://gems.rubyforge.org/gems/jekyll-pagination-${pkgver}.gem")
noextract=("jekyll-pagination-${pkgver}.gem")
md5sums=("e89d3de23547de480ca84331764c8f04")

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" jekyll-pagination-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
