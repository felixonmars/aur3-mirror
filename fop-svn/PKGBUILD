# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname=fop-svn
pkgver=r924863
pkgrel=2
pkgdesc="XSL-FO implementation in Java"
arch=('any')
url="http://xmlgraphics.apache.org/fop/"
license=('APACHE')
depends=('java-xmlgraphics-commons-svn' 'java-commons-logging'
  'java-commons-io' 'java-batik' 'java-avalon-framework')
makedepends=('apache-ant' 'java-environment')
source=('fop.conf')
md5sums=('6ee5aa760e5a3403fa9b37dfc51b333f')
provides=('fop')
conflicts=('fop')

build() {
  mkdir $srcdir/$pkgname-$pkgver
  cd $srcdir/$pkgname-$pkgver
  svn co http://svn.apache.org/repos/asf/xmlgraphics/fop/trunk
  cd trunk
  /usr/share/java/apache-ant/bin/ant package || return 1
  install -d $pkgdir/usr/share/java/fop/ || return 1
  install -d $pkgdir/usr/bin/ || return 1
  install -d $pkgdir/etc || return 1
  install --mode=644 $srcdir/$pkgname-$pkgver/trunk/build/fop.jar \
    $pkgdir/usr/share/java/fop || return 1
  install --mode=644 $srcdir/fop.conf $pkgdir/etc || return 1
  install $srcdir/$pkgname-$pkgver/trunk/fop $pkgdir/usr/bin/ || return 1
}
