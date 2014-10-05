# Maintainer: Gabriel Sabillon
# Contributor: Tsarev Nikita
pkgname=mylaunchpad
pkgver=0.3
pkgrel=6
pkgdesc="Eyecandy Full Screen launcher script for openbox and other stand-alone window managers"


arch=('any')
url="https://github.com/gaboelnuevo/mylaunchpad"
license=('GPL')
depends=('python2' 'python2-lxml' 'pygtk' 'cairo' 'python2-cairo' 'python2-imaging' 'gnome-menus2')
makedepends=('git')
optdepends=()
provides=('mylaunchpad')
md5sums=('SKIP')
backup=('etc/mylaunchpad.conf')

source=('mylaunchpad::git+http://github.com/gaboelnuevo/mylaunchpad')

build() {
    cd ${srcdir}
}

package() {
    cd "$srcdir/$pkgname"
    python2 setup.py install --root ${pkgdir}
}
