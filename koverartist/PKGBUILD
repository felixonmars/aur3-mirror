#Contributor: Urs Wolfer <uwolfer @ fwo.ch>
#Mantaince: Adria Arrufat <swiftscythe @ gmail.com>

pkgname=koverartist
pkgver=0.7.6
pkgrel=2
pkgdesc="A program for the fast creation of covers for CD/DVD cases and boxes."
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php?content=38195"
license="GPL"
depends=('kdelibs')
source=(http://kde-apps.org/CONTENT/content-files/38195-$pkgname\_$pkgver.orig.tar.bz2)
md5sums=('c85a34755c37c1229af44cee94073556')

build() {
  cd ${srcdir}
  rm -rf ${srcdir}/build
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build || return 1

  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
