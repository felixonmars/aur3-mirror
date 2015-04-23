# Maintainer: murchik <mixturchik@gmail.com>

pkgname=ack2-git
pkgver=2.14.r103.g862687f
pkgrel=1
pkgdesc="A Perl-based grep replacement, aimed at programmers with large trees of heterogeneous source code. Clone of ack-git package, but 2nd version repo."
arch=('any')
url="http://betterthangrep.com/"
license=('GPL' 'PerlArtistic')
depends=('perl-file-next')
makedepends=('git')
provides=('ack')
conflicts=('ack', 'ack-git')
options=('!emptydirs')
source=('ack2-git::git://github.com/petdance/ack2.git')
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    git checkout dev

    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
    find "$pkgdir" \( -name '.packlist' -o -name 'perllocal.pod' \) -delete
}
