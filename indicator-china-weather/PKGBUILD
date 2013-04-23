# Maintainer: Jove Yu < yushijun110[AT]gmail.com >

pkgname=indicator-china-weather
pkgver=1.0.5
pkgrel=1
pkgdesc="indicator-china-weather"
arch=('i686' 'x86_64')
url="https://launchpad.net/~ubuntukylin-members/+archive/ubuntukylin"
license=('GPL')
groups=('unity-extra')
depends=( 'libappindicator' 'python2' 'python2-dbus' 'python2-gobject' 'pygtk' 'python2-gconf' 'gsettings-desktop-schemas')
makedepends=('python2-distutils-extra')
install=indicator-china-weather.install
source=("https://launchpad.net/~ubuntukylin-members/+archive/ubuntukylin/+files/indicator-china-weather_1.0.5-0~58~raring1_amd64.deb")
md5sums=('f56cfe2ab5bc3b250e3f12349625bcfd')

package() {
  tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
  cd ${pkgdir}/usr/bin/
  sed -i 's/python/python2/g' indicator-china-weather
  cd ${pkgdir}/usr/share/indicator-china-weather/src
  sed -i 's_#!/usr/bin/python$_#!/usr/bin/python2_' *.py  
}

