# Contributer: Marc Argent <marc.argent@queens.ox.ac.uk>
pkgname=javamail
pkgver=1.4
pkgrel=1
pkgdesc="The JavaBeans Activation Framework standard extension"
url="http://java.sun.com/products/javamail/"
license="custom"
arch=('i686')
depends=('j2re' 'jaf>=1.1' 'unzip')
source=(http://www.itsnotnormal.co.uk/files/java/$pkgname-1_4.zip)
md5sums=('4541a84c4d329291fe87b57fde276b0e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  install -D -m755 mail.jar $startdir/pkg/opt/java/jre/lib/mail.jar
  install -D -m755 LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt
}
