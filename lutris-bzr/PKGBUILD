# Maintainer: FoolEcho <foolecho at gmail dot com>
pkgname=lutris-bzr
pkgver=243
pkgrel=1
pkgdesc="Lutris is a gaming platform aiming to support as many games as possible for the GNU/Linux operating system."
arch=('any')
url="http://lutris.net/"
license=('GPL3')
depends=('python2-gconf' 'wxpython' 'python2-xdg' 'python2-yaml' 'python2-imaging' 'python2-gobject' 'desktop-file-utils')
optdepends=(
  'joy2key: for programs that otherwise lack native joystick support'
  'pyglet: for fullscreen coverflow'
)
makedepends=('bzr' 'python2-distutils-extra')
install=lutris.install

#_bzrtrunk=lp:lutris
_bzrmod=lutris
source=("$_bzrmod::bzr+https://code.launchpad.net/~strycore/lutris/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_bzrmod
  bzr revno
}

prepare() {
  cd "$srcdir"/$_bzrmod
  find ${srcdir}/${_bzrmod} -name "*py" -exec sed 's/python/python2/' -i {} \;
}

package() {
  cd "$srcdir"/$_bzrmod
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
