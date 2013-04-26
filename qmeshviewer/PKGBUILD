# Contributer: giacomogiorgianni@gmail.com 

pkgname=qmeshviewer
pkgver=1.2
pkgrel=1
pkgdesc="is a small 3D mesh viewer with an embedded thumbnails generator"
arch=(i686 x86_64)
url="http://opendesktop.org/content/show.php/QMeshViewer?content=149042"
license=('GPL')
depends=('glew' 'kdebase-runtime')
source=(http://www.zuzuf.net/$pkgname/files/$pkgname-$pkgver-src.tar.gz)
md5sums=('d24a93489b4da14f2f916081104b0514')
install="$pkgname.install"

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  qmake-qt4 $pkgname.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/" \
    "LOWERED_APPNAME=$pkgname"
  make
  
  install -D -m755 $pkgname ${pkgdir}/usr/bin/$pkgname
  # desktop 
  install -Dm644 distrib/ubuntu/$pkgname.desktop  "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm644 kdeintegration/mesh-mime.xml "${pkgdir}/usr/share/doc/qmeshviewer/mesh-mime.xml"
  cp  README "${pkgdir}/usr/share/doc/qmeshviewer/"
  install -Dm644 icons/$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  
  cd kdeintegration
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
  make DESTDIR=${pkgdir} install
}