# Maintainer: Jesse Jaara <gmail: jesse.jaara>

pkgname=javassist
pkgver=3.13.GA
pkgrel=1
pkgdesc="Makes Java bytecode manipulation simple"
arch=(any)
url="http://www.csg.is.titech.ac.jp/~chiba/javassist/index.html"
license=('lGPL' 'MPL')
depends=('java-runtime')
makedepends=('unzip')
source=(http://sunet.dl.sourceforge.net/jboss/Javassist/3.13.0.GA/javassist-$pkgver.zip)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share/doc/javassist"
  mkdir -p "$pkgdir/usr/share/java/javassist"
  cp -r {sample,html} "$pkgdir/usr/share/doc/javassist/"
  install -D -m644 javassist.jar \
    "${pkgdir}/usr/share/java/javassist/javassist.jar"

}

# vim:set ts=2 sw=2 et:
md5sums=('f969cd02618dc02106c2a10de444e50f')
md5sums=('f7b3350378e58dbc95176f2516266acf')
