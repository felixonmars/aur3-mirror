# $Id: PKGBUILD 45737 2011-04-28 07:19:04Z angvp $
# Maintainer: Angel Velásquez <angvp@archlinux.org> 
# Contributor: helq <linuxero789@gmail.com>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: DobleD <dobled@dobled.info>
pkgname=ninja-ide-beta
_pkgname=ninja-ide
pkgver=2.0
pkgrel=3
pkgdesc="cross-platform integrated development environment specially design to build Python Applications (beta version)"
arch=('any')
url="http://ninja-ide.org/"
license=('GPL3')
depends=('python2' 'python2-qt' 'python2-pygments' 'python2-rope')
makedepends=('unzip')
changelog=${_pkgname}.changelog
conflicts=('ninja-ide')
provides=('ninja-ide')
source=("https://github.com/downloads/ninja-ide/ninja-ide/ninja-ide-beta3.zip" "ninja-ide.desktop")
md5sums=('6c97be2c609b7bc46b27cfb8b152092c'
         'ea11ecc37e80d88a2d222fc91f392372')

build() {
  cd $srcdir/$_pkgname-beta3
  mkdir -p ${pkgdir}/usr/share/applications
  python2 setup.py install --root=$pkgdir
}

package() {
  cd $srcdir/$_pkgname-beta3
  install -D -m644 "${srcdir}/ninja-ide.desktop" "${pkgdir}/usr/share/applications/"
  echo "#!/bin/bash
  python2 /usr/bin/ninja-ide.py" > ${pkgdir}/usr/bin/${_pkgname}
  chmod 755 ${pkgdir}/usr/bin/${_pkgname}
}
