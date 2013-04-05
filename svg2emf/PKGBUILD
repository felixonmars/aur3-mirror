# Maintainer: Vianney le Clément <vleclement AT gmail · com>
pkgname=svg2emf
pkgver=0.0.2
pkgrel=1
pkgdesc="Converts SVG (Scalable Vector Graphics) files to EMF (Enhanced Meta File)"
arch=(any)
url="http://code.google.com/p/$pkgname/"
license=('LGPL')
depends=('java-runtime')
source=("http://$pkgname.googlecode.com/files/$pkgname.jar"
        svg2emf.sh)
noextract=("$pkgname.jar")
md5sums=('cd4a5afd3374ccb36ca46c787e459e00'
         '1eb213014c948864de09a163e6ee52b8')
sha1sums=('eb1d6126f50d6529d06bb14e6ee4782255cc0232'
          '1e3c11491ca26debfa39bffa3bcda037f3fd1a5e')

package() {
  cd "$srcdir"

  install -Dm644 $pkgname.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"  
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
