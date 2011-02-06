# Contributor: DuGi <dugi@irc.pl>

pkgname=cobras
pkgver=0.18
pkgrel=1
pkgdesc="An IDE for linux programmers."
arch=('i686' 'x86_64')
url="http://www.beesoft.org/index.php?id=cobras"
license=('GPL')
depends=('qt')
source=(http://www.beesoft.org/download/${pkgname}_${pkgver}_src.tar.gz \
        $pkgname.desktop)

md5sums=('7f5d6a2337b4f9922fe0b6009ff35702'
         '8fcfe0da670fc8da748dce30f9cc9218')

build() {
  cd "${srcdir}/$pkgname"

  qmake || return 1
  make || return 1
  install -D -m755 "$pkgname" "${pkgdir}/usr/bin/$pkgname" || return 1
  install -D -m644 "./img/cobras.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png" || return 1
  install -D -m644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop" || return 1
}
