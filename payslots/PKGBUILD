# Maintainer: Milos Pejovic <pejovic@gmail.com>
# Contributor: Emanuele Rossi <newdna1510@yahoo.it>
pkgname=payslots
pkgver=0.4.1
pkgrel=1
pkgdesc="Combine fruits to collect points, you can increase points with aditional bonuses"
arch=('any')
url="http://www.njsoft.iz.rs/payslots/en/"
license=('GPL')
depends=('pygtk')
source=(http://www.fileden.com/files/2011/1/12/3057694/payslots.tar.gz)
md5sums=('fa71b10f9d4fc3533dceb139ca84f6c5')

build() {
  cd "${srcdir}/payslots"
  make PREFIX="${pkgdir}/usr"

  rm -f "${pkgdir}/usr/share/applications"
  rm -f "${pkgdir}/usr/share/icons"
  install -D -m644 payslots.desktop "${pkgdir}/usr/share/applications/payslots.desktop"
  install -D -m644 payslots.png "${pkgdir}/usr/share/icons/payslots.png"

  sed -i -e 's|python|python2|' "${pkgdir}/usr/bin/payslots"
}
