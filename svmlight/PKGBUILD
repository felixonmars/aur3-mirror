# PKGBUILD author: chimeracoder <dev@chimeracoder.net>
# Contributor: Stefan Seemayer (mail@semicolonsoftware.de)
pkgname=svmlight
pkgver=6.02
pkgrel=2
pkgdesc="An implementation of Support Vector Machines (SVMs) in C"
url="http://svmlight.joachims.org/"
depends=('gcc')
makedepends=('help2man')
license=('custom')
arch=('i686' 'x86_64')
source=('http://download.joachims.org/svm_light/current/svm_light.tar.gz')
md5sums=('59768adde96737b1ecef123bc3a612ce')

build() {
    cd $srcdir/
    make all

    # build manpages
    echo -e "\n" | help2man -Nh "'-?'" --version-string="$pkgver" ./svm_learn | sed '/(more)/d' | sed 's/More details in:/.SH "REFERENCES"\n.PP\n.PP/' > svm_learn.1
    echo -e "\n" | help2man -Nh "'-?'" --version-string="$pkgver" ./svm_classify  > svm_classify.1

}

package() {

    install -Dm 755 $srcdir/svm_learn $pkgdir/usr/bin/svm_learn
    install -Dm 755 $srcdir/svm_classify $pkgdir/usr/bin/svm_classify

    install -Dm 644 $srcdir/svm_learn.1 $pkgdir/usr/share/man/man1/svm_learn.1
    install -Dm 644 $srcdir/svm_classify.1 $pkgdir/usr/share/man/man1/svm_classify.1

    install -Dm 644 $srcdir/LICENSE.txt $pkgdir/usr/share/licenses/svmlight/LICENSE

}
