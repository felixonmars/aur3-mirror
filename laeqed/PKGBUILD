# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=laeqed
pkgver=1.2
pkgrel=1
pkgdesc="LaTeX equation editor targeted at producing PNG images."
arch=(any)
license=('GPL')
url="http://www.thrysoee.dk/laeqed/"
depends=('java-runtime')
source=(http://www.thrysoee.dk/laeqed/Laeqed.jar laeqed.sh)

md5sums=('26974d4cc6fa9f316958f3f6be3757cc'
         '3ebc7c7bf5496370b62e49501c1bbb90')

build() {
    mkdir -p $startdir/pkg{/usr/bin,/usr/share/java/$pkgname} || return 1
    install -m755 laeqed.sh $startdir/pkg/usr/bin/laeqed || return 1
    install -m644 $srcdir/Laeqed.jar $startdir/pkg/usr/share/java/$pkgname || return 1
}
