# Contributor: DuGi <dugi@irc.pl>

pkgname=imagicom
pkgver=1.3
pkgrel=1
pkgdesc="A simple application for bulk picture processing."
arch=('i686' 'x86_64')
url="http://www.beesoft.org/index.php?id=imagicom"
license=('GPL')
depends=('qt' 'imagemagick')
source=(http://www.beesoft.org/download/${pkgname}_${pkgver}_src.tar.gz \
        $pkgname.desktop)

md5sums=('cabb2a8f8d4fced4e83d6ab30ff41e90'
         '842e0d5fb214f2cfc797e4b00b3cb30e')

build() {
  cd "${srcdir}/$pkgname"

  qmake || return 1
  make || return 1
  install -D -m755 "$pkgname" "${pkgdir}/usr/bin/$pkgname" || return 1
  install -D -m644 "./img/imagicom.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png" || return 1
  install -D -m644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop" || return 1
}
