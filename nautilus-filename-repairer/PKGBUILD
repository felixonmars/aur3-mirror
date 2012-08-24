# Contributor: Juri Hamburg <juri@fail2fail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=nautilus-filename-repairer
pkgver=0.1.1
pkgrel=2
pkgdesc="Nautilus extension to correct a filename encoding"
arch=('i686' 'x86_64')
url="http://code.google.com/p/repairer/"
license=('GPL2')
groups=()
depends=('nautilus')
makedepends=('intltool')
source=(http://repairer.googlecode.com/files/$pkgname-$pkgver.tar.bz2
        gtk3-fix.patch)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/gtk3-fix.patch

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

md5sums=('26786ab4f613dea870860013e756200b'
         '7965ade88853839d170ded213b35c10a')
