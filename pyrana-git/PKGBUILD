# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=pyrana-git
pkgver=20110711
pkgrel=1
pkgdesc="A minimalist music player that plays random music from your collection."
arch=('i686' 'x86_64')
url="https://github.com/jdodds/pyrana"
license=('BSD')
install=pyrana.install
depends=('gstreamer0.10-python>=0.10.0' 'pyglet' 'python-feather' 'python-notify>=0.1.1' 'python-pygame' 'python2-nose')
makedepends=('git')
conflicts=('pyrana')

_gitroot=https://github.com/jdodds/pyrana.git
_gitname=pyrana


build() {
   cd $srcdir

   msg "Connecting to GIT server...."

   if [ -d $srcdir/$_gitname ] ; then
     cd $_gitname && git pull --rebase
   else
     git clone $_gitroot
   fi

   msg "GIT checkout done or server timeout"
   msg "Starting installation..."

   cd $srcdir/$_gitname

   python2 setup.py install --root=$pkgdir --optimize=1

   # Desktop icon
   install -Dm644 ./build/lib/pyrana/resources/playing.png $pkgdir/usr/share/pixmaps/pyrana.png
   install -Dm644 $startdir/pyrana.desktop $pkgdir/usr/share/applications/pyrana.desktop

   # License
   install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/pyrana/LICENSE
}