# Maintainer: Jove Yu < yushijun110[AT]gmail.com >

pkgname=touchpad-indicator
pkgver=0.9.3.12
pkgrel=1
pkgdesc="An indicator for the touchpad"
arch=('i686' 'x86_64')
url="https://launchpad.net/"
license=('GPL')
groups=('unity-extra')
depends=( 'libappindicator' 'python2' 'python2-dbus' 'python2-gobject' 'pygtk' 'python2-gconf' 'gsettings-desktop-schemas' 'python2-polib' 'python2-pyudev' 'lsb-release')
makedepends=('python2-distutils-extra')
install=touchpad-indicator.install
source=("https://launchpad.net/~atareao/+archive/atareao/+files/touchpad-indicator_0.9.3.12-1ubuntu1.tar.gz")
md5sums=('e7cb9c772f0c865b7410765adbb3fc96')

package() {
  cd ${srcdir}/touchpad-indicator/src/
  sed -i 's_#! /usr/bin/python$_#! /usr/bin/python2_' *.py  
  sed -i 's_#!/usr/bin/python$_#!/usr/bin/python2_' *.py  

  cd ${srcdir}/touchpad-indicator/
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

