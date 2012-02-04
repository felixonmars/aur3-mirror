# Submitter: Maksim Sipos <msipos@mailc.net>
pkgname=rdp-classifier
pkgver=2.2
pkgrel=1
pkgdesc="Naive Bayesian classifier that can provide taxonomic assignments for 16s rRNA sequences."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/rdp-classifier/"
license=('GPL')
depends=('java-runtime')
makedepends=()
optdepends=()
backup=()
options=()
source=("http://downloads.sourceforge.net/$pkgname/rdp_classifier_$pkgver.zip"
        "rdp-classifier")
md5sums=('745db57e1644ca4cca8330bb954d0b2c'
         'e19baf93e52db0a0477d23e9b8428980' )

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/opt/rdp-classifier
  mkdir -p $pkgdir/usr/bin
  cp rdp-classifier $pkgdir/usr/bin
  cp -R $srcdir/rdp_classifier_$pkgver/* $pkgdir/opt/rdp-classifier
}
