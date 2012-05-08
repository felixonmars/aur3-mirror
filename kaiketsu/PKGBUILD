pkgname=kaiketsu
pkgver=0.5
pkgrel=2
pkgdesc="A simple sudoku solver based on KDE 3"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=28255"
license=('GPL')
depends=('kdelibs3')
source=("http://web.tiscali.it/gulbros/sito_nuovo/${pkgname}.${pkgver}.tar.bz2")
md5sums=('81ff0076dc550bc0f9c5aa5d35aff01f')

build() {
  cd "${srcdir}/${pkgname}.${pkgver}"
  ./configure \
    --prefix=/opt/kde \
    --without-arts \
    QTDIR=/opt/qt
  make
}

package() {
  cd "${srcdir}/${pkgname}.${pkgver}"
  make DESTDIR="${pkgdir}" install

  echo '/opt/kde/bin/kaiketsu' > ${pkgname}
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
