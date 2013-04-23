#
# Maintainer: JT Wilkinson <jowilkin at tu dot archserver dot org>
#
# Note: Apache ant and java must be on the path for make to succeed.
#       If either was installed as a dependency during the build, you
#       will need to log out and then log back in for the changes to
#       your path and JAVA_HOME environment variable to take effect.
#
pkgname=xbmc-addon-iptvsimple
pkgver=0.1.2
_commit=2d551be
pkgrel=1
pkgdesc="Add support for Live TV watching and EPG TV Guide through IPTV provided by the Internet providers in exUSSR countries"
arch=('i686' 'x86_64')
url="https://github.com/afedchin/xbmc-addon-iptvsimple"
license=('GPL2')
depends=('xbmc<=12.1')
makedepends=('git')
source=($pkgname-$pkgver.tgz::https://github.com/afedchin/xbmc-addon-iptvsimple/tarball/v$pkgver)
md5sums=('a20bde92197e68612f237e268756f02c')

build() {
  cd "$srcdir/afedchin-$pkgname-$_commit"
  sh autogen.sh
  ./configure
  make
}

package() {
  cd "$srcdir/afedchin-$pkgname-$_commit"
  make DESTDIR="$pkgdir" install
  rm $pkgdir/usr/share/xbmc/addons/pvr.iptvsimple/Makefile
  rm $pkgdir/usr/share/xbmc/addons/pvr.iptvsimple/Makefile.am
  rm $pkgdir/usr/share/xbmc/addons/pvr.iptvsimple/Makefile.in
  rm $pkgdir/usr/share/xbmc/addons/pvr.iptvsimple/XBMC_IPTV_Simple.pvr
}
