# Contributor : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=gopher
pkgver=3.0.13
pkgrel=1
pkgdesc="The Gopher+ client based on the University of Minnesota's Internet Gopher+ distribution for UNIX machines"
arch=('i686' 'x86_64')
url="http://gopher.quux.org:70/give-me-gopher/"
license=('gpl')
depends=()
source=("http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gopher/gopher_3.0.13.tar.gz")
md5sums=('c15490a80bfe324d9c860ec9c6d32a9e')

build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=$pkgdir/usr --mandir=$pkgdir/usr/share/man --sysconfdir=$pkgdir/etc --enable-locale
  make || return 1
}
package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share
  mkdir -p $pkgdir/etc
  make install
}
