pkgname=perl-filesys-smbclientparser
_realname=Filesys-SmbClientParser
pkgver=2.7
pkgrel=1
pkgdesc="Filesys::SmbClientParser - Perl client to reach Samba ressources with smbclient"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_realname}/"
license=('PerlArtistic')
depends=('perl>=5.10.0' 'smbclient')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/A/AL/ALIAN/${_realname}-${pkgver}.tar.gz)
#        disable_request.patch)
md5sums=('16f73fb28db6e2d7f97690f01f6c1bd0')

build() {
    cd ${startdir}/src/${_realname}-${pkgver}
    
    # get rid of the requests while configuring
#    patch -Np1 -i "${srcdir}/disable_request.patch" || return 1
    
    # install module in vendor directories.
    perl Makefile.PL INSTALLDIRS=vendor || return 1
    make  || return 1
}

package() {
    cd ${startdir}/src/${_realname}-${pkgver}
    make install DESTDIR=${startdir}/pkg || return 1
}
