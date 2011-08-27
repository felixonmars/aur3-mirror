# Contributor: xnitropl <xnitropl at gmail dot com>
pkgname=nogravity-cvs
_pkgname=nogravity
pkgver=20090401
pkgrel=1
pkgdesc="A space shooter in 3D."
url="http://www.realtech-vr.com/nogravity/"
arch=('i686')
license=('GPL')
depends=('libvorbis' 'libogg' 'zlib' 'libpng' 'sdl' 'sdl_mixer' 'libstdc++5' 'openal' 'libgl')
optdepends=('nogravity-data: original dataset')
makedepends=('cvs')
source=(nogravity.sh
        nogravity.desktop)
md5sums=('677a4a11e4d6682504d3d86aac5bc196'
         '26c4f28bb67afe6cdcdb28d8defd4344')

_cvsroot=":pserver:anonymous@$_pkgname.cvs.sourceforge.net:/cvsroot/$_pkgname"

build() {
  msg "Connecting to $_pkgname.sourceforge.net CVS server...."
  cd $srcdir
  mkdir -p $_pkgname
  cvs -z3 -d $_cvsroot co -P $_pkgname

  msg "Starting make..."
  cd $srcdir/$_pkgname/src/Linux
  ./bootstrap || return 1
  ./configure --enable-sound=sdl_mixer || return 1
  make || return 1

  install -D -m755 nogravity $pkgdir/opt/$_pkgname/nogravity
  install -D -m755 $startdir/nogravity.sh $pkgdir/usr/bin/nogravity
  install -D -m644 $startdir/nogravity.desktop $pkgdir/usr/share/applications/nogravity.desktop
}
# vim:set ts=2 sw=2 et:
