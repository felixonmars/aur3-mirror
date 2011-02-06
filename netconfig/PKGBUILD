# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=netconfig
pkgver=0.3.3
pkgrel=1
pkgdesc="Very simple tool for configuring network (wired or wifi) connections with gui and also with command line in console mode."
arch=('i686' 'x86_64')
url='http://www.qt-apps.org/content/show.php/netconfig?content=109052&PHPSESSID=b1b8c9412cbab92e57a24b48a08e3cd2'
license=('GPL')
makedepends=()
depends=('qt')
conflicts=()
provides=('netconfig')
install=()
backup=()
source=(http://www.qt-apps.org/CONTENT/content-files/109583-${pkgname}-${pkgver}.tar.bz2
	netconfig.desktop)

md5sums=('2bf58b516f2b90577e382764e399b10f'
         '93459a5ba560f2122899095afa8b0ddf')

build() {
  cd "${srcdir}/${pkgname}"

  qmake || return 1
  make || return 1

  install -Dm755 netconfig ${pkgdir}/usr/bin/netconfig
  install -Dm644 ${srcdir}/netconfig.desktop ${pkgdir}/usr/share/applications/netconfig.desktop
  install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}