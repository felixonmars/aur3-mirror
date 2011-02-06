# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=bluemarine
pkgver=0.9
pkgrel=RC2b.3244
pkgdesc="An open source application for the digital photo workflow."
arch=('any')
url="http://bluemarine.tidalwave.it/"
license=('Apache')
depends=('openjdk6')
makedepends=('deb2targz')
source=('https://bluemarine.dev.java.net/files/documents/5150/71709/bluemarine_0.9.RC2b.3244_all.deb')
noextract=('bluemarine_0.9.RC2b.3244_all.deb')
md5sums=('801f2ba0143f640319b5cb738f4df061')

build() {
  mkdir $srcdir/$pkgname-$pkgver/
  deb2targz bluemarine_0.9.RC2b.3244_all.deb
  cp $startdir/bluemarine_0.9.RC2b.3244_all.tar.gz $srcdir/
  cd $srcdir/$pkgname-$pkgver/

  tar -xf ../bluemarine_0.9.RC2b.3244_all.tar.gz
  cp -R $srcdir/$pkgname-$pkgver/* $pkgdir/
}
