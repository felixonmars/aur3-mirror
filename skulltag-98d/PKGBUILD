# Contributor: Sean Streeter <anubis2591 at gmail dot com>
# Maintainer: Egorov Sergei  <trm.seven at gmail dot com>
pkgname=skulltag-98d
pkgver=098d
pkgrel=1
pkgdesc="Closed source OpenGL ZDoom port with Client/Server multiplayer."
arch=(i686)
url="http://skulltag.com/"
license=('closed')
groups=()
#st can be run without p7zip, and timidity++
depends=(flac sdl p7zip gtk2 libjpeg6)
optdepends=('timidity++: midi support'
	    'freedoom: free IWAD')
install=${pkgname}.install
source=(http://skulltag.com/download/files/release/st-v${pkgver}_linux-base.tar.bz2 http://skulltag.com/download/files/release/st-v${pkgver}_linux-x86.tar.bz2 http://www.fmod.org/index.php/release/version/fmodapi42416linux.tar.gz)
md5sums=('afe482e04ce3f51c94915e07c3aff3b0'
         'faa005fc5b44da424d87d6a17eaafccb'
	 '00b157e8d09d539b0a7023c48b71422a')


build() {
  cd $srcdir

  mkdir -p $pkgdir/usr/local/share/{skins,announcer}
  install -D -m755 skulltag $pkgdir/usr/bin/skulltag
  install -D -m755 skulltag-server $pkgdir/usr/bin/skulltag-server
  install -D -m644 {skulltag,skulltag_data}.pk3 $pkgdir/usr/local/share/
  install -D -m775 libsnes_spc.so $pkgdir/usr/lib/libsnes_spc.so
  install -D -m644 skins/*.pk3 $pkgdir/usr/local/share/skins
  install -D -m644 announcer/Skulltag_98a_announcer.pk3 $pkgdir/usr/local/share/announcer
  install -D -m775 fmodapi42416linux/api/lib/libfmodex-4.24.16.so $pkgdir/usr/lib/libfmodex-4.24.16.so
}
