# Maintainer: Bart Verhoeven <nepherte at archlinux dot us>

pkgname=svm_rank
pkgver=1.00
pkgrel=1
pkgdesc="Implementation of SVMs for the problem of learning a ranking function."
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
makedepends=()
url="http://www.cs.cornell.edu/People/tj/svm%5Flight/svm_rank.html"
source=("http://download.joachims.org/svm_rank/v$pkgver/$pkgname.tar.gz")
sha256sums=('909f67bf57b13916acc78fd6aa8794df93be9f29d90a03e9dc2d7a49fe4dd7b2')

build() {
    cd $srcdir/
    make
}

package() {
  cd $srcdir

  install -d -m755 $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/share/licenses/$pkgname
  install -m755 svm_rank_learn $pkgdir/usr/bin
  install -m755 svm_rank_classify $pkgdir/usr/bin
  install -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname
}
