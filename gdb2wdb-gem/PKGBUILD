# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>
_gemname=gdb2wdb
pkgname=$_gemname-gem
pkgver=0.1
pkgrel=1
pkgdesc="A bridge utility between GDB protocol and Wind River's debbugging protocol"
arch=(any)
url="http://firstforge.wpi.edu/sf/projects/c--11_toolchain"
license=('GPL')
depends=(ruby)
makedepends=(rubygems)
source=("hg+https://bitbucket.org/alexbrinister/gdb2wdb-fork")
sha512sums=('SKIP')

package() {
  cd "$srcdir/$_gemname-fork"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  rake gem
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "pkg/$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
