# Contributor: Nick Marakhovskiy <father@mnv.org.ua>

pkgname="ses-tools"
_pkgname="ses-tools"
pkgver="2011.10.31"
_pkgver=${pkgver//\./-}
pkgrel=3
pkgdesc="Amazon Simple Email Service Scripts."
arch=('any')
url="http://aws.amazon.com/developertools/Amazon-SES/8945574369528337"
license=('APACHE')
depends=('perl' 'perl-switch' 'perl-uri' 'perl-libwww' 'perl-crypt-ssleay' 'perl-xml-libxml')
makedepends=('unzip')
source=(http://d36cz9buwru1tt.cloudfront.net/catalog/attachments/${_pkgname}-${_pkgver}.zip)
noextract=('*')
md5sums=('df5329a84363b4bd2fbb239b147132f1')

build() {
    unzip ${_pkgname}-${_pkgver}.zip

    mkdir -p ${pkgdir}/usr/bin || return 1
    mkdir -p ${pkgdir}/usr/share/perl5/site_perl || return 1
    mkdir -p ${pkgdir}/usr/share/doc/${_pkgname}-${_pkgver} || return 1
    cp ${srcdir}/bin/ses-*.pl		${pkgdir}/usr/bin || return 1
    cp ${srcdir}/bin/SES.pm		${pkgdir}/usr/share/perl5/site_perl || return 1
    cp ${srcdir}/bin/LICENSE		${pkgdir}/usr/share/doc/${_pkgname}-${_pkgver} || return 1
    cp ${srcdir}/bin/NOTICE		${pkgdir}/usr/share/doc/${_pkgname}-${_pkgver} || return 1
    cp ${srcdir}/bin/README		${pkgdir}/usr/share/doc/${_pkgname}-${_pkgver} || return 1
    cp ${srcdir}/bin/ca-bundle.crt	${pkgdir}/usr/share/doc/${_pkgname}-${_pkgver} || return 1
}
