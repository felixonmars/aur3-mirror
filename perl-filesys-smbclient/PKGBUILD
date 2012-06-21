# Contributor: Tilo Brueckner  blueperil at gmx de

pkgname=perl-filesys-smbclient
_realname=Filesys-SmbClient
pkgver=3.99_51
pkgrel=1
pkgdesc="Interface for access Samba filesystem with libsmclient.so"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_realname}/"
license=('PerlArtistic')
depends=('perl>=5.10.0' 'smbclient')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PH/PHILIPP/${_realname}-${pkgver}.tar.gz
        disable_request.patch)
sha256sums=('1586aca093878d60f321679cb84dd8cf36c429bae30fdf520008f5e2e0f0fe4f'
            '3611d8430fe7add0bf72cd911936c1e0be4a4ba20d789f3143809cc0f05285f1')

build() {
    cd ${startdir}/src/${_realname}-${pkgver}

    # get rid of the requests while configuring
    patch -Np1 -i "${srcdir}/disable_request.patch" || return 1

    # install module in vendor directories.
    perl Makefile.PL INSTALLDIRS=vendor || return 1
    make  || return 1
}

package() {
    cd ${startdir}/src/${_realname}-${pkgver}
    make install DESTDIR=${startdir}/pkg || return 1
}
