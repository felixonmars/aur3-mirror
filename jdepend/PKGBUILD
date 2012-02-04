# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=jdepend
pkgver=2.9
pkgrel=2
pkgdesc="Traverses Java class file directories and generates design quality metrics for each Java package."
arch=('any')
url="http://clarkware.com/software/JDepend.html"
license=('BSD')
depends=('java-runtime')
source=(http://www.clarkware.com/software/jdepend-2.9.zip)
md5sums=('4e979c0dda766ba1dd719905ca975c7b')

build() {
  cd $srcdir/$pkgname-$pkgver/lib
  install -D -m 644 $pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname-$pkgver.jar

  mkdir -p $pkgdir/usr/bin

  # GUI
  echo "#!/bin/sh

java -cp /usr/share/java/$pkgname/$pkgname-$pkgver.jar jdepend.swingui.JDepend \$@" > $pkgdir/usr/bin/jdepend-gui
  chmod +x $pkgdir/usr/bin/jdepend-gui

  # Text
  echo "#!/bin/sh

java -cp /usr/share/java/$pkgname/$pkgname-$pkgver.jar jdepend.textui.JDepend \$@" > $pkgdir/usr/bin/jdepend
  chmod +x $pkgdir/usr/bin/jdepend

  # XML
  echo "#!/bin/sh

java -cp /usr/share/java/$pkgname/$pkgname-$pkgver.jar jdepend.xmlui.JDepend \$@" > $pkgdir/usr/bin/jdepend-xml
  chmod +x $pkgdir/usr/bin/jdepend-xml
}
# vim:syntax=sh
