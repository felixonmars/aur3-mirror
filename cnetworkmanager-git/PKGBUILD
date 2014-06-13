# Maintainer: ZavonAJ <zavon at jazpr dot com>
# Contributor: roverorna <roverorna at gmail dot com>
# Contributor: WonderWoofy <sugar.and.scruffy at gmail dot com>

 
pkgname=cnetworkmanager-git
_gitname="cnetworkmanager"
pkgver=v0.1.666.129.ge2c0011
pkgrel=1
pkgdesc="Command Line Interface for NetworkManager"
arch=('i686' 'x86_64')
url="http://vidner.net/martin/software/cnetworkmanager/"
license=('GPL')
depends=('networkmanager' 'dbus-python' 'pygobject')
makedepends=('git' 'setuptools')
source=('git://github.com/mvidner/cnetworkmanager.git')
md5sums=('SKIP')
 
 
pkgver() {
cd $_gitname
git describe --always | sed 's|-|.|g'
}
 
build() {
cd $_gitname
#Set python2 in pbkdf2.py and setup.py
sed -i 's|/usr/bin/env python|/usr/bin/env python2|' ./networkmanager/applet/pbkdf2.py
sed -i 's|/usr/bin/env python|/usr/bin/env python2|' ./setup.py
}
 
package() {
cd "${srcdir}/${_gitname}"
./setup.py build install --root="$pkgdir" --optimize=1
}
