# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Marty_Stoopid <>
# Contributor: Marty_Stoopid <>
pkgname=qtrainer
pkgver=0.6
pkgrel=2
pkgdesc="Qtrainer is a personal home trainer"
arch=('i686' 'x86_64')
url="https://github.com/dprevite/pysshfs"
license=('GPL')
#groups=
#provides=
depends=('qt4')
makedepends=()
#conflicts=()
#replaces=()
#install=
source=(qtrainer
		  qtrainer.png
		  qtrainer.desktop)
md5sums=('8dbf53df898b1af3cc2230a68c48c53c'
			'e8a1164b7aed7478f1199c589afcc9c0'
			'c5fc9419b1775a46d4ad30e249dbdff2')
package() {

# Install the executables
  install -Dm644 qtrainer "${pkgdir}/usr/bin/qtrainer"
  chmod +x ${pkgdir}/usr/bin/qtrainer

# Install the .desktop file
  install -Dm644 qtrainer.desktop "${pkgdir}/usr/share/applications/qtrainer.desktop"

# Install the icon
  install -Dm644 qtrainer.png "${pkgdir}/usr/share/pixmaps/qtrainer.png"

# Change the ownership to root
  chown -R root:root ${pkgdir}/*
}