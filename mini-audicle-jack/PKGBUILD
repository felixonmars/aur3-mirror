# Maintainer: jlu85 <jlu85 at ono dot com>

pkgname=(mini-audicle-jack)
pkgver=1.3.0a
pkgrel=1
pkgdesc="The miniAudicle is a light-weight integrated development environment for the ChucK digital audio programming language. (jack version)"
arch=('i686' 'x86_64')
url="http://audicle.cs.princeton.edu/"
license=('LGPL')
depends=('libsndfile' 'qt4' 'mesa' 'jack')
conflicts=('miniaudicle' 'mini-audicle')
source=(${url}mini/release/files/miniAudicle-${pkgver}.tgz)
md5sums=('a38487f9033dc2b0719bf84e74ed76f9')

build() {
  cd $srcdir/miniAudicle-$pkgver/src
  
  make linux-jack || return 1
  
}
package(){
  mkdir -p ${pkgdir}/usr/bin || return 1
  cp $srcdir/miniAudicle-$pkgver/src/miniAudicle ${pkgdir}/usr/bin || return 1
}

