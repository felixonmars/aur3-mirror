# Maintainer: MkFly <mmkfly@gmail.com>
# Contributor: Igor Nemilentsev <trezorg@gmail.com>

pkgname=vboxapi
pkgver=3.2.10
_build=66523
pkgrel=1
pkgdesc='VirtualBox SDK (PUEL binary edition)'
arch=('i686' 'x86_64')
url='http://www.virtualbox.org'
license=('custom:PUEL')
#depends=('virtualbox_bin')
makedepends=('python')
source=(http://dlc.sun.com/virtualbox/${pkgver}/VirtualBoxSDK-${pkgver}-${_build}.zip)
md5sums=('7d1094a989474990e2655c0633bc7734')

package() {
  cd $srcdir/sdk/installer
  export VBOX_INSTALL_PATH='/opt/VirtualBox'
  python vboxapisetup.py install --root $pkgdir
  mkdir -p $pkgdir/opt/VirtualBox
  cp -r $srcdir/sdk $pkgdir/opt/VirtualBox
}