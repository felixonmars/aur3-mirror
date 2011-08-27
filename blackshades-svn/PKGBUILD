# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=blackshades-svn
pkgver=110
pkgrel=1
pkgdesc="A game where you control a psychic bodyguard, and try to protect the VIP from hordes of would-be assassins"
arch=('i686')
url="http://icculus.org/blackshades/"
license=('uDevGame')
conflicts=()
depends=('sdl' 'sdl_image' 'openal' 'libvorbis' 'mesa' 'freealut')
makedepends=('subversion')
source=(blackshades.patch)
md5sums=('bb04f4414f4a7a693b8bad4314399145')
install=

_svntrunk=svn://svn.icculus.org/blackshades/trunk/
_svnmod=blackshades

build() {
  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  patch -Np0 -i $startdir/src/blackshades.patch || return 1
  msg "Starting make..."
  cd $_svnmod
  make || return 1

  install -d $pkgdir/opt/$pkgname/ $pkgdir/usr/bin/ $pkgdir/usr/share/licenses/common/uDevGame
  install -m755 objs/blackshades $pkgdir/opt/$pkgname/
  install -m644 Readme uDevGame_License uDevGame_Readme $pkgdir/opt/$pkgname/
  svn export Data $pkgdir/opt/$pkgname/Data

  echo -e "#!/bin/sh\n cd /opt/$pkgname/; ./blackshades" > $pkgdir/usr/bin/$pkgname
  chmod 755 $pkgdir/usr/bin/$pkgname

  install -m644 $pkgdir/opt/$pkgname/uDevGame_License $pkgdir/usr/share/licenses/common/uDevGame/
}
