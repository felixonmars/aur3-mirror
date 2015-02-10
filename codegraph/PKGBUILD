# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=codegraph
pkgver=0.7.21
pkgrel=0
pkgdesc="Analyse source code dependencies (C, Fortran, Bash, Perl)"
arch=(i686 x86_64)
url="https://github.com/Try2Code/codegraph"
license=('BSD')
groups=(tools)
depends=(ruby)
makedepends=(rubygems)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('f79a54a70b0e6bcd7aef40e88da5253c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install --install-dir "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
# vim:set ts=2 sw=2 et:
