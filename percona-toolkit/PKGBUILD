# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Felix Hanley <felix@seconddrawer.com.au>
# Contributor: Sławomir Kowalski <suawekk@gmail.com>
pkgname=percona-toolkit
pkgver=2.2.13
pkgrel=1
pkgdesc="A collection of advanced command-line tools to perform a variety of MySQL and system tasks."
url="http://www.percona.com/software/percona-toolkit/"
arch=('any')
license=('GPLv2')
depends=('perl-time-hires' 'perl-term-readkey')
optdepends=(
    'perl-dbd-mysql: MySQL connections'
    'perl-dbi: MySQL connections'
)
makedepends=('perl')
source=("http://www.percona.com/redir/downloads/${pkgname}/${pkgver}/tarball/${pkgname}-${pkgver}.tar.gz")
md5sums=('d75230a2e0089661840a67539f5ab277')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
        PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
        PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
        MODULEBUILDRC=/dev/null
        
        perl Makefile.PL PREFIX=/usr
        make
        make test
        
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install
}
