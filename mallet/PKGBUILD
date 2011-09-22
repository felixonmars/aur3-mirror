# Maintainer: jpate <j.k.pate@sms.ed.ac.uk>
pkgname=mallet
pkgver=2.0.7
maintainer="jpate"
pkgrel=1
pkgdesc="MAchine Learning for LanguagE Toolkit"
arch=('any')
url="http://mallet.cs.umass.edu/"
license=('CPL')
depends=( 'java-runtime' )
source=("http://mallet.cs.umass.edu/dist/mallet-${pkgver}.tar.gz")
md5sums=('7e4f0195aa2e0af065ee9aca236f3b66')

build() {
  cd $srcdir/mallet-${pkgver}/

  make jar || return 1

  mkdir -p $pkgdir/usr/share/java/$pkgname
  mkdir -p $pkgdir/bin/

  install -m644 $srcdir/$pkgname-$pkgver/lib/mallet{,-deps}.jar $pkgdir/usr/share/java/$pkgname/
  install -m644 $srcdir/$pkgname-$pkgver/bin/* $pkgdir/usr/share/java/$pkgname/
}

