# Maintainer: McNoggins <gagnon88 AT gmail DOT com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Curtis Smith <kman922002@gmail.com>

pkgname=odamex-svn
pkgdesc='A free client/server multiplayer engine for the classic FPS Doom (svn version)'
pkgver=r5181
pkgrel=1
arch=('i686' 'x86_64')
url='http://odamex.net/'
license=('GPL')
depends=('sdl_mixer>=1.2.6' 'wxgtk')
makedepends=('cmake')
provides=('odamex')
conflicts=('odamex')
optdepends=('timidity++: Required for music')
source=($pkgname::"svn+http://odamex.net/svn/root/trunk")
sha256sums=('SKIP')

pkgver() {
  echo "r"$(grep -o 'VERSION=[0-9.]\+' $pkgname/src/configure.in | tr -d 'A-Z=')$(svnversion "$SRCDEST"/$pkgname/ | tr -d 'a-zA-z')
}
         
build() {
  cd $srcdir/$pkgname
  
  cmake .
  make
}

package() {
  cd $srcdir/$pkgname

  install -Dm755 client/odamex "$pkgdir/usr/bin/odamex"
  install -Dm755 server/odasrv "$pkgdir/usr/bin/odasrv"
  install -Dm755 odalaunch/odalaunch "$pkgdir/usr/bin/odalaunch"
  install -Dm644 odamex.wad "$pkgdir/usr/share/odamex/odamex.wad"
  install -Dm644 media/icon_odamex_96.png "$pkgdir/usr/share/pixmaps/odamex.png"
  install -Dm644 media/icon_odasrv_96.png "$pkgdir/usr/share/pixmaps/odasrv.png"
  install -Dm644 media/icon_odalaunch_96.png "$pkgdir/usr/share/pixmaps/odalaunch.png"
  install -Dm644 installer/arch/odamex.desktop "$pkgdir/usr/share/applications/odamex.desktop"
  install -Dm644 installer/arch/odasrv.desktop "$pkgdir/usr/share/applications/odasrv.desktop"
  install -Dm644 installer/arch/odalaunch.desktop "$pkgdir/usr/share/applications/odalaunch.desktop"
}

# vim:set ts=2 sw=2 et:
