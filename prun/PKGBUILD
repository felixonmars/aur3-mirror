# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
pkgname=prun
pkgver=1.0.5
pkgrel=0
pkgdesc="Let run shell jobs in parallel on defined number of threads"
arch=(i686 x86_64)
url="https://github.com/Try2Code/jobQueue"
license=('BSD')
groups=(system)
depends=(ruby)
makedepends=(rubygems)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://rubygems.org/downloads/jobQueue-$pkgver.gem)
noextract=(jobQueue-$pkgver.gem)
md5sums=('63d397b1eafeb7e9b7fd7a305a9b5e23')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
# vim:set ts=2 sw=2 et:
