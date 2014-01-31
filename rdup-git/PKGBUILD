# Maintainer: techmunk <aur@techmunk.com>
pkgname=rdup-git
pkgver=0.9.0.r700.g7bd2cec
pkgrel=1
pkgdesc="Generates a file list suitable for making backups. Processing tool included."
arch=('i686' 'x86_64')
url="https://github.com/miekg/rdup"
license=("GPL3")
depends=('glib2' 'pcre' 'libarchive' 'nettle')
makedepends=('git' 'autoconf')
conflicts=('rdup')
provides=('rdup')
source=("$pkgname"::'git+https://github.com/miekg/rdup.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$pkgname
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc
  make -j1
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
