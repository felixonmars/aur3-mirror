# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=tomboy-image
pkgver=0.2
pkgrel=1
pkgdesc="A tomboy plugin to support Insert images"
arch=('i686' 'x86_64')
url="http://mattguo.com/tomboy-image/"
license=('GPL')
depends=('tomboy')

source=(http://mattguo.com/tomboy-image/InsertImage.dll)
md5sums=(c8c09441dd44fb2d91420bfe734a0a47)

package() {
  cd $srcdir
  install -d $pkgdir/usr/lib/tomboy/addins
  install InsertImage.dll $pkgdir/usr/lib/tomboy/addins/
}

