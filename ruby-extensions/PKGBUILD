# Maintainer: snyh <snyh@snyh.org>
pkgname=ruby-extensions
pkgver=0.6.0
pkgrel=1
pkgdesc="'extensions' is a set of extensions to Ruby's built-in classes.  It gathers common idioms, useful additions, and aliases, complete with unit testing and documentation, so they are suitable for production code."
arch=('any')
url="http://extensions.rubyforge.org"
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
source=("http://gems.rubyforge.org/gems/extensions-${pkgver}.gem")
noextract=("extensions-${pkgver}.gem")
md5sums=("01daa9bc5c4c21a9ca763ca9fb5e299f")

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" extensions-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}
