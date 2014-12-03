# Maintainer:
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: mpie <michael.kyne-phillips1@ntlworld.com>

pkgname=ifpgui
pkgver=1.0.0
pkgrel=1
pkgdesc="A Linux GUI for the iRiver iFP flash portable player"
arch=('i686' 'x86_64')
url="http://ifpgui.sourceforge.net/"
license=('GPL')
depends=('libusb' 'qt4')
source=(http://downloads.sourceforge.net/sourceforge/ifpgui/$pkgname-$pkgver.tar.gz
        $pkgname.desktop ifp.png)
sha256sums=('5f1d80ef7db5bafe81682c9daf7ebcbddbf839496c261a8443e2b15305038244'
            '58edcb051c827a15722771ce5e01aa8ac66706123f29045c2d84e11374acc217'
            'f7fb4d00f957dadcc638764c934762d62c3405c444d54ff14c2fd452efa8be7d')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  sed -i "s|qmake|qmake-qt4|" build.sh
  ./build.sh

  install -Dm755 bin/$pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm755 bin/nonroot.sh "${pkgdir}"/usr/bin/$pkgname-nonroot.sh

#translation not used in this location
#  install -d "${pkgdir}"/usr/share/$pkgname/translations/
#  cp translations/*.qm "${pkgdir}"/usr/share/$pkgname/translations/

#.desktop and icon file
  install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -Dm644 "${srcdir}"/ifp.png "${pkgdir}"/usr/share/pixmaps/ifp.png
}
