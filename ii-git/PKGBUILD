# Contributor: Anthony Martin <ality@pbrane.org>
# Contributor: Chris Brannon <cmbrannon79 (at) gmail.com>

pkgname=ii-git
_pkgname=ii
pkgver=1.7.r2.g41ce43b
pkgrel=1
pkgdesc="A minimalist FIFO and filesystem-based IRC client"
url="http://tools.suckless.org/ii/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('ii')
conflicts=('ii')
source=('git+http://git.suckless.org/ii')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # make install sets permissions to 775...
  chmod 755 "$pkgdir/usr/bin/ii"
}
