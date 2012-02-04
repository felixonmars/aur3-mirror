# Contributer: Marc Argent <marc.argent@queens.ox.ac.uk>
pkgname=jaf
pkgver=1.1
pkgrel=1
pkgdesc="The JavaBeans Activation Framework standard extension"
url="http://java.sun.com/products/javabeans/glasgow/jaf.html"
license="custom"
arch=('i686')
depends=('j2re' 'unzip')
source=(http://www.itsnotnormal.co.uk/files/java/$pkgname-1_1-fr.zip)
md5sums=('7423eb6831ba82e7d1f10956eb2bd0d3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  install -D -m755 activation.jar $startdir/pkg/opt/java/jre/lib/activation.jar
  install -D -m755 LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt
}
