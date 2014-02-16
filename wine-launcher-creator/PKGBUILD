#$ $Id$
# Contributor: Malina <mali#arch>
#Maintainer: You?

pkgname=wine-launcher-creator
pkgver=1.0.8
pkgrel=1
pkgdesc="python gui for creating wine launchers (icons and desktop files)"
arch=('any')
url="https://code.google.com/p/wine-launcher-creator/"
license=('GPL')
depends=('python2' 'icoutils' 'xdg-utils' 'python2-pyqt4')
#makedepends=('intltool')
optdepends=('nautilus-actions: To integrate with nautilus')
source=("https://wine-launcher-creator.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
install=$pkgname.install

prepare() {
  cd ${srcdir}/${pkgname}
  # python2 fix
  for file in $(find . -name "*.py" -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  sed -i s/1.0.6/${pkgver}/g wlcreator.desktop
  sed -i /nautilus/d Makefile
  sed -i /tor.desktop/d Makefile 
sed -i s,/usr/local,/usr,g wlcreator.py
}

package() {
  rm -rf ${pkgdir}
  cd ${srcdir}/${pkgname}
  make prefix="$pkgdir/usr" install
  install -Dm0644 wlcreator.desktop ${pkgdir}/usr/share/applications/wlcreator.desktop

}
md5sums=('b1b22cfd61dc19a8ef8cf060776008a3')
