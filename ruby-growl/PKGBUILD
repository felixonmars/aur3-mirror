# Maintainer: snyh <snyh@snyh.org>
pkgname=ruby-growl
pkgver=1.0.3
pkgrel=1
pkgdesc="growlnotify bindings"
arch=('any')
url="http://github.com/visionmedia/growl"
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
source=("http://gems.rubyforge.org/gems/growl-${pkgver}.gem")
noextract=("growl-${pkgver}.gem")
md5sums=("c1c204914be5f277bffbae96e7ebaf4b")

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" growl-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
