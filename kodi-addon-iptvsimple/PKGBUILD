# Maintainer: Artem Klevtsov a.a.klevtsov@gmail.com
pkgname=kodi-addon-iptvsimple
pkgver=0.1.3
pkgrel=1
pkgdesc="Add support for Live TV watching and EPG TV Guide through IPTV provided by the Internet providers in exUSSR countries"
arch=('i686' 'x86_64')
url="https://github.com/afedchin/xbmc-addon-iptvsimple"
license=('GPL2')
depends=('kodi')
replaces=('xbmc-addon-iptvsimple' 'xbmc-addon-iptvsimple-git')
source=("https://github.com/afedchin/xbmc-addon-iptvsimple/archive/v${pkgver}.zip")
md5sums=('c1d30c15a3aa9ba57ebd5907c4529458')

build() {
  cd "${srcdir}/xbmc-addon-iptvsimple-${pkgver}"
  sh autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib/kodi/addons --datadir=/usr/share/kodi/addons
  make
}

package() {
  cd "${srcdir}/xbmc-addon-iptvsimple-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm $pkgdir/usr/share/kodi/addons/pvr.iptvsimple/addon.xml.in
  rm $pkgdir/usr/share/kodi/addons/pvr.iptvsimple/Makefile
  rm $pkgdir/usr/share/kodi/addons/pvr.iptvsimple/Makefile.am
  rm $pkgdir/usr/share/kodi/addons/pvr.iptvsimple/Makefile.in
  rm $pkgdir/usr/share/kodi/addons/pvr.iptvsimple/XBMC_IPTV_Simple.pvr
}
