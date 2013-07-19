# Maintainer: Alexej Magura <agm2819*gmail*>
#
#

pkgname=perl-printer
_pkgname=printer
pkgver=0.71.0_rc1
pkgrel=0
pkgdesc="Perl module that provides various ways to print text to STDOUT, among other things."
arch=(any)
url="https://bitbucket.org/hav3lock/pub_rel"
license=('BSD')
groups=('')
depends=('perl>=5.10.0') 
makedepends=('')
options=()
source=("https://bitbucket.org/hav3lock/pub_rel/downloads/$_pkgname-${pkgver}.tar.gz" "changelog.patch" "Makefile.patch")
md5sums=(f852f2f60b9a4944991b1b1d2f1deb97 20fcd7d9f7d2d83da81e8a497d09fa10 2574d4bae54c5329361e18f74d9bebf3) 

prepare() {

    cd "$srcdir/$_pkgname-$pkgver"

    patch -N Release_notes -i $srcdir/changelog.patch --verbose
    patch -N Makefile -i $srcdir/Makefile.patch --verbose

}

package() {
 
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}

