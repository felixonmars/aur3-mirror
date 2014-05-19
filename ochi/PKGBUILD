# Contributor: Pafrape <pafrape[at]free.fr>
 
pkgname=ochi
_pkgname=Ochi
pkgver=0.1.1
pkgrel=2
pkgdesc="A webcam application and motion detector"
arch=('x86_64')
url="http://kde-apps.org/content/show.php/Ochi?content=165256"
license=('GPL')
depends=('qt4')
makedepends=('opencv')
source=("http://kde-apps.org/CONTENT/content-files/165256-${_pkgname}-${pkgver}.tgz"
         "lib-path-fix.patch"
	"ochi.desktop")
screenshot=('http://kde-apps.org/CONTENT/content-pre1/165256-1.png')
md5sums=('8c7dc1cf154488ab62040367efae0dfe'
         'cab0ac748cc4da3885956fd9d05e44ac'
         '1a267da0d0df9f4eb4a3330e2fc46653')
 
 
prepare() {
  cd $srcdir/$_pkgname
  patch -p1 -i $srcdir/lib-path-fix.patch 
}
 
build() {
  cd $srcdir/$_pkgname
  qmake-qt4 $_pkgname.pro
  make
}
 
package() {
  cd $srcdir/$_pkgname
  install -D -m 755 "$srcdir/Ochi/Ochi" "$pkgdir/usr/bin/ochi"
  install -D -m 644 "$srcdir/ochi.desktop" "$pkgdir/usr/share/applications/ochi.desktop" 
  install -D -m 644 "$srcdir/$_pkgname/icons/motion.png" "$pkgdir/usr/share/Ochi/Ochi.png"
}