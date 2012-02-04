# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=gmdesk
pkgver=1.01
pkgrel=2
pkgdesc="Adobe AIR software to access Google's service without a browser"
arch=('i686' 'x86_64')
url="http://www.robertnyman.com/gmdesk/"
license=('MIT')
depends=('adobe-air')
source=(http://gmdesk.googlecode.com/files/GMDesk-${pkgver}.air 'LICENSE' 'gmdesk')
md5sums=('513435260b377c7730f4f0c60f6a3b18' \
         '1570b190c16fe5a8700a448993949f98' \
         '43c1f63bf8dcdf07a8a33a846a30ed96') 

build() {
  cd ${srcdir}/

  install -d ${pkgdir}/{opt/${pkgname},usr/{bin,share/licenses/${pkgname}}}
  install GMDesk-${pkgver}.air ${pkgdir}/opt/${pkgname}/
  install -m755 gmdesk ${pkgdir}/usr/bin/
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
