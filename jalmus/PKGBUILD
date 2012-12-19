# Maintainer: David Campbell <davekong@archlinux.us>
pkgname=jalmus
pkgver=2.3
pkgrel=1
pkgdesc="Free sight-reading software"
arch=('any')
url='http://www.jalmus.net/'
license=('GPL')
depends=('java-runtime' 'sh')
source=('http://sourceforge.net/projects/jalmus/files/Jalmus-2.3/installjalmus23.jar' 'jalmus.sh' 'jalmus.xml')
md5sums=('422d8e050edaf28569a790dfe739ac59'
         '735307e1fae8265b1def0df4ad837505'
         '4d5d6616877a12426a3759829b09bb3e')

build() {
sed -i "s%pkgdir%$pkgdir%g" jalmus.xml
java -jar installjalmus23.jar jalmus.xml
install -Dm755 jalmus.sh $pkgdir/usr/bin/jalmus
}

# vim:set ts=2 sw=2 et:
