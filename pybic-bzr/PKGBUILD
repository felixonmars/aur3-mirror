# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=pybik-bzr
pkgver=228
pkgrel=1
pkgdesc="Pybik is a 3D interactive graphics puzzle. It renders an image of a magic cube (similar to a rubik cube) and you attempt to solve it."
url="https://launchpad.net/pybik"
arch=('any')
depends=('python-gtkglext' 'python2-numpy')
makedepends=('bzr' 'cython' 'gettext' 'intltool')
license=('GPL3')
conflicts=('pybik')

_bzrtrunk=lp:pybik/trunk
_bzrmod=pybik

build() {
   cd $srcdir

   msg "Connecting to the server...."

   if [ ! -d ./${_bzrmod} ]; then
     bzr co ${_bzrtrunk} ${_bzrmod}
   else
     bzr up ${_bzrmod}
   fi

   msg "Connecting to the server...."

   cd $srcdir/$_bzrmod

   # Python2 fix
   sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' setup.py ./tools/create_manpage.py

   python2 setup.py install --root=$pkgdir --optimize=1

   # Desktop icon
   install -Dm644 $startdir/pybik.desktop $pkgdir/usr/share/applications/pybik.desktop
}
