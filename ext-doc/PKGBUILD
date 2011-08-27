# Contributor: Damien Churchill <damoxc@gmail.com>

pkgname=ext-doc
pkgver=1.0.131
pkgrel=1
pkgdesc="ExtJS-style JavaScript comments processor"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ext-doc/"
license=('GPL3')
depends=('java-runtime')
makedepends=()
source=(http://ext-doc.googlecode.com/files/$pkgname-$pkgver.zip
		ext-doc.sh)
options=('!emptydirs')
md5sums=('636b916d12eaaec4077f1181609824c7'
         'e21a8e059c2f46db3429a814d5ecc17e')

build() {
  cd $srcdir
  ls
  install -D -m755 -d $pkgdir/usr/share/java/$pkgname
  cp -r $pkgname-$pkgver/* $pkgdir/usr/share/java/$pkgname/
  install -D -m755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname
}
