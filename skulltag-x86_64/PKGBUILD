# Contributor: Joe Davison < joe@thosedamnpeanuts.com >
pkgname=skulltag-x86_64
pkgver=098c
pkgrel=2
pkgdesc="Closed source OpenGL ZDoom port with Client/Server multiplayer. 64-bit version."
arch=(x86_64)
url="http://skulltag.net/"
license=('closed')
groups=()
#st can be run without nasm,p7zip, and timidity++
depends=(flac sdl p7zip gtk2 libjpeg6)
optdepends=('timidity++: midi support'
	    'freedoom: free IWAD')
install=${pkgname}.install
source=(http://www.skulltag.com/download/files/release/st-v${pkgver}_linux-base.tar.bz2 http://skulltag.net/download/files/release/st-v${pkgver}_linux-x86_64.tar.bz2 http://www.fmod.org/index.php/release/version/fmodapi42416linux64.tar.gz)
md5sums=('eede2c60d68616aea97198bb2c50811a'
         'cae0294c8d02d98344bb38e20cdb5755'
	 '70b2a6a2618ee9823ab564b4e945c885')


build() {
  cd $srcdir

  mkdir -p $pkgdir/usr/local/share/{skins,announcer}
  install -D -m755 skulltag $pkgdir/usr/bin/skulltag
  install -D -m755 skulltag-server $pkgdir/usr/bin/skulltag-server
  install -D -m644 {skulltag,skulltag_data}.pk3 $pkgdir/usr/local/share/
  install -D -m775 libsnes_spc.so $pkgdir/usr/lib/libsnes_spc.so
  install -D -m644 skins/*.pk3 $pkgdir/usr/local/share/skins
  install -D -m644 announcer/Skulltag_98a_announcer.pk3 $pkgdir/usr/local/share/announcer
  install -D -m775 fmodapi42416linux64/api/lib/libfmodex64-4.24.16.so $pkgdir/usr/lib/libfmodex64.so
}
md5sums=('fd879df951aa977462b3c4968ef7a2bf'
         #'f296ab31a926be06a8342853ab1239f4'
	 'cae0294c8d02d98344bb38e20cdb5755'
         '70b2a6a2618ee9823ab564b4e945c885') 
