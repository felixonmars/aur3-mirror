# Contributor: Weirch Sodora <sodora@gmail.com>

pkgname=perl-apache-htpasswd
_pkgname=Apache-Htpasswd
pkgver=1.9
pkgrel=2
pkgdesc="Apache::Htpasswd - Manage Unix crypt-style password file."
arch=('any')
url="http://search.cpan.org/~kmeltz/Apache-Htpasswd/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-crypt-passwdmd5')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/K/KM/KMELTZ/$_pkgname-$pkgver.tar.gz)
md5sums=('ee2ca41f9dd92d7a830a5ba65fcbeef0')

build() {
    cd  $_pkgname-$pkgver
    perl Makefile.PL INSTALLDIRS=vendor
    make
}

check() {
    cd $_pkgname-$pkgver
    make test
}

package() {
    cd $_pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

