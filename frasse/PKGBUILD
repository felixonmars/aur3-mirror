# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=frasse
pkgver=1
pkgrel=1
pkgdesc="Frasse and the Peas of Kejick is a point and click adventure game using the Sludge Engine."
arch=(any)
url="http://trumgottist.com/frasse-and-the-peas-of-kejick/"
license=('freeware')
depends=('sludge-engine')
source=(http://trumgottist.com/files/Frasse%20\(Mac\).zip)
md5sums=('ad6a9f3873f76c598dc4e3ebb9ff99e7')

build() {
  mkdir -p $pkgdir/usr/share/${pkgname}/
  mkdir -p $pkgdir/usr/bin/
  cp $srcdir/Frasse\ and\ the\ Peas\ of\ Kejick.app/Contents/Resources/* $pkgdir/usr/share/${pkgname}/
}



package() {
	    
    echo "cd /usr/share/frasse/
sludge-engine -w -a1 Gamedata.slg" > $pkgdir/usr/bin/${pkgname}

    chmod +x $pkgdir/usr/bin/${pkgname}
    
#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/../$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}



