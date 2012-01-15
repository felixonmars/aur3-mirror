# Maintainer: Bart Verhoeven <nepherte at archlinux dot us>

pkgname=svm_light
pkgver=6.02
pkgrel=2
pkgdesc="Implementation of Vapnik's SVM for the problem of pattern recognition, regression and learning a ranking function."
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
makedepends=()
url="http://svmlight.joachims.org/"
source=("http://download.joachims.org/svm_light/current/$pkgname.tar.gz")
md5sums=('59768adde96737b1ecef123bc3a612ce')

build() {
    cd $srcdir/
    make
}

package() {
  cd $srcdir

  install -d -m755 $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname
  install -m755 svm_learn $pkgdir/usr/bin
  install -m755 svm_classify $pkgdir/usr/bin
  install -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname
}
