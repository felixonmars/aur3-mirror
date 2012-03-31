# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=scdp
pkgver=0.3.5
pkgrel=1
pkgdesc="Play audio CD from Systray"
arch=(any)
url="http://sonlinkblog.blogspot.com/p/systray-cd-player.html"
license=('GPL3')
groups=()
depends=('python2' 'pygtk' 'gstreamer0.10-python')
source=(http://dl.dropbox.com/u/58286032/programas/${pkgname}-${pkgver}.tar.gz)
md5sums=('5eef43b3b5669dd988c56ff420444667')

package() {
  cd "${srcdir}"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/locale
  mkdir -p $pkgdir/usr/share/applications
  
  install -m755 ${pkgname}.py $pkgdir/usr/bin/$pkgname
  sed -i "s/lang/\/usr\/share\/locale/g" $pkgdir/usr/bin/$pkgname
  sed -i "s|\(usr/bin/env python\).*|\12|" $pkgdir/usr/bin/$pkgname

  cp lang/* -r $pkgdir/usr/share/locale/
  
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
}
