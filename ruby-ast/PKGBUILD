# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
_gemname=ast
pkgname=ruby-$_gemname
pkgver=2.0.0
pkgrel=1
pkgdesc='A Ruby library for working with Abstract Syntax Trees.'
arch=(any)
url='http://github.com/whitequark/ast'
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('e8912628cabb49357e69f741b707b5b92c1be8be596e236589c4c44e6d453cd2')

package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
