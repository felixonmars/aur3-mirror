# Contributor: Alessio Di Fazio <slux83@gmail.com>

pkgname=webqam
pkgver=1.0.0
pkgrel=1
pkgdesc="An useful systray application that show and organize your webcams"
arch=('i686')
url="http://code.google.com/p/webqam/"
license=('GPL')
depends=('qt')
source=(http://webqam.googlecode.com/files/webQam-$pkgver-src.tar.gz \
        $pkgname.desktop \
        $pkgname.png)

md5sums=('966b8f6cbf46b458794421fd836aa300'
         'ea7caa31991afd78f49c8c26c50247bb'
         '8a54fd76f5f2a174aecccd4c6075e134')

build() {
  cd "${srcdir}/webQam-$pkgver"

  qmake webQam.pro
  make || return 1
  install -D -m755 "${srcdir}/webQam-$pkgver/bin/webQam" "${pkgdir}/usr/bin/$pkgname" || return 1
  install -D -m644 "${srcdir}/$pkgname.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png" || return 1
  install -D -m644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop" || return 1
}
