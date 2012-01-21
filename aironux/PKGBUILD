# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=aironux
pkgver=1.7
pkgrel=1
pkgdesc="Search and listen or download music"
arch=(any)
license=('GPL')
url="http://www.scenebeta.com/noticia/aironux"
depends=('gstreamer0.10-python' 'python2' 'wxpython' 'python-notify' 'gstreamer0.10' 'gstreamer0.10-bad')
source=('http://dl.dropbox.com/u/31191693/aironux.tar.gz' 'aironux.desktop')
md5sums=('084693df468eddfe6b09ddf82ee24862'
         'e9abe39c02e619a37207b21b19973b1f')

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p $pkgdir/usr/share/$pkgname
  mkdir -p $pkgdir/usr/bin
  
  install -m755 ${pkgname}.sh $pkgdir/usr/bin/$pkgname
  sed -i "s/data/\/usr\/share\/$pkgname/g" $pkgdir/usr/bin/$pkgname
  sed -i "s/python/python2/g" $pkgdir/usr/bin/$pkgname

  cp -r data/* $pkgdir/usr/share/$pkgname/
  chmod -R 777 $pkgdir/usr/share/$pkgname/
  
  mkdir -p $pkgdir/usr/share/applications/
  install -Dm644 "${srcdir}/aironux.desktop" "${pkgdir}/usr/share/applications/"
	
}
