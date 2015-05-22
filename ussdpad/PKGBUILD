# Maintainer: Shashika Layan
# smslayan@gmail.com

pkgname=ussdpad
pkgver=1.0
pkgrel=1
pkgdesc="GUI Linux USSD Sender"
arch=('any')
url="http://sourceforge.net/projects/ussdpad/"
license=('GPL')
depends=('python2-pyqt4' 'python2' 'xdg-utils' 'gksu' 'perl-expect>=1.21')
makedepends=('perl>=5.8')
source=('http://nchc.dl.sourceforge.net/project/ussdpad/ussdpad-sc-v1.2.tar.gz')
sha256sums=('7e808cf90c8269c5f75540c7187da37a89a10711357c10bcee3f574f496a812b')

build() {
  cd ${srcdir}/ussdpad-sc/dip/gsm-ussd
  chmod 777 make-all.sh
  chmod 777 make-install.sh
  ./make-all.sh
}

package() {
  cd "${pkgdir}"
  mkdir -p usr/share/man
  mkdir -p opt
  mkdir -p opt/ussdpad
  mkdir -p usr/bin
  mkdir -p usr/share/applications
  mkdir -p usr/share/icons
  cd usr/share/man
  mkdir -p man1 de/man1
  cd ${srcdir}/ussdpad-sc/dip/gsm-ussd
  make PREFIX="${pkgdir}/usr" install install-doc
  cd ${srcdir}/ussdpad-sc
  tar -xzvf ussdpad.tar.gz -C ${pkgdir}/opt/ussdpad
  cp -a ussdpad ${pkgdir}/usr/bin
  cp -a ussdpad.desktop ${pkgdir}/usr/share/applications
  cp -a ussdpad.png ${pkgdir}/usr/share/icons  
}

