# Maintainer: Romain Schmitz <myself at slopjong dot de>

pkgname=eclipse-artifacts
pkgver=0.1.1
pkgrel=1
pkgdesc="PKGBUILD generator for eclipse plugins."
arch=('any')
url="https://github.com/slopjong/eclipse-artifacts"
license=('GPL')
depends=('qt')
source=( 
	'https://github.com/slopjong/eclipse-artifacts/tarball/v0.1.1'
	'https://github.com/slopjong/QuaZIP/tarball/v0.4.4'
)
	
md5sums=(
	'c2926a543247a4b090d84c48bf096bdd'
	'2ef4996c45ba12bb98d983d42f32e9c7'	
)

build() {
  
  mv $srcdir/slopjong-QuaZIP*/quazip $srcdir/slopjong-eclipse*/3rd-party/QuaZIP
  cd $srcdir/slopjong-eclipse*
  qmake
  make
 }
 
 package() {
  cd $srcdir/slopjong-eclipse-artifacts-*
  mkdir -p $pkgdir/usr/bin
  mv eclipse-artifacts $pkgdir/usr/bin
 }