# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=aironux
pkgver=1.9
pkgrel=1
pkgdesc=("Search and/or download music")
arch=(any)
license=('GPL')
url="http://ironsistem.com/web/aironux/"
depends=('python2' 'wxpython' 'mplayer')
if [ "$CARCH" = "i686" ]; then
	source=('https://dl.dropboxusercontent.com/u/58286032/aur/Aironux_x86.tar.gz' 'aironux.desktop')
	md5sums=('c1586bada4536eff4e94f0f04e478799'  
	'e9abe39c02e619a37207b21b19973b1f')
elif [ "$CARCH" = "x86_64" ]; then
	source=('https://dl.dropboxusercontent.com/u/58286032/aur/Aironux_x64.tar.gz' 'aironux.desktop')
	md5sums=('2cb23fd68686a1526e547339d1e9259a'
         'e9abe39c02e619a37207b21b19973b1f')
fi

package() {
  cd "${srcdir}/Aironux"

  mkdir -p $pkgdir/opt/$pkgname
  mkdir -p $pkgdir/usr/bin
  
  echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
  echo "cd /opt/$pkgname/ && ./Aironux.iron" >> $pkgdir/usr/bin/$pkgname
  chmod 755 $pkgdir/usr/bin/$pkgname

  cp * $pkgdir/opt/$pkgname/
  
  mkdir -p $pkgdir/usr/share/applications/
  install -Dm644 "${srcdir}/aironux.desktop" "${pkgdir}/usr/share/applications/"
	
}
