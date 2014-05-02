# Maintainer: demian <mikar Î±Ï„ gmx Î´Î¿Ï„ de>
pkgname=spotifycmd
pkgver=0.5
pkgrel=2
pkgdesc="A tool to control a running instance of Spotify under wine"
arch=("any")
url="http://code.google.com/p/spotifycmd"
license=("GPL2")
depends=("wine")
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('8091723c4cbc540608de44a165116a86c13714a09cce3d3a639596bf161e5c9c')
case ${CARCH} in
    x86_64) depends=(${depends[@]} "lib32-ncurses");;
    i686) depends=(${depends[@]} "ncurses");;
esac

package() {
  install -d    ${pkgdir}/usr/bin
  install -m755 ${srcdir}/${pkgname}/* ${pkgdir}/usr/bin/
  ln -sf /usr/bin/spotify_cmd.exe ${pkgdir}/usr/bin/${pkgname}
}
