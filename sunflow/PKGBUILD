# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=sunflow
pkgver=0.07.2
pkgrel=10
pkgdesc="Global illumination rendering system"
arch=('any')
url="http://sunflow.sourceforge.net/"
depends=('java-runtime')
makedepends=('subversion')
license=('MIT')
install=sunflow.install
source=(http://downloads.sourceforge.net/sourceforge/sunflow/$pkgname-bin-v$pkgver.zip \
	sunflow.sh sunflow.desktop sunflow.png)
md5sums=('5806cafff80db23c275203589ce2f5d4'
         '3d2b099be4bac57e8db94aed51c87457'
         '7c0cb3b5d6ee66086d84a3cc66ac3768'
         '810ed7db16faa6d11c9b1978e4aca39b')

package() {
  cd "$srcdir"
  svn co https://sunflow.svn.sourceforge.net/svnroot/sunflow/trunk/exporters/blender .

  cd "$srcdir"/$pkgname

  mkdir -p "$pkgdir"/usr/share/java/$pkgname
  install -m644 {janino,sunflow}.jar "$pkgdir"/usr/share/java/$pkgname
  
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 "$srcdir"/sunflow_export.py "$pkgdir"/usr/share/blender/scripts/sunflow_export.py
  install -D -m755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -D -m644 "$srcdir"/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
