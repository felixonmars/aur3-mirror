# Maintainer: Vladimir Chizhov <master@mirlord.com>

pkgname=xmlroff
pkgver=0.6.2
pkgrel=1
pkgdesc="XSL formatter that aims to excel at DocBook formatting"
url="https://github.com/MenteaXML/xmlroff"
license=('custom')
arch=('i686' 'x86_64')
depends=('libxslt' 'librsvg')
makedepends=()
source=("http://ftp.debian.org/debian/pool/main/x/xmlroff/${pkgname}_${pkgver}.orig.tar.gz"
        "http://ftp.debian.org/debian/pool/main/x/xmlroff/xmlroff_0.6.2-1.2.diff.gz")
md5sums=('658052e56f92ec9ef2a16f08cc4c6fe2'
         '82bca45bc1bc86af762a4081960dfea4')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 < $srcdir/xmlroff_0.6.2-1.2.diff
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -D -m 644 -p COPYING $pkgdir/usr/share/licenses/xmlroff/license.txt
}

