# Contributor: Nick Marakhovskiy <father@mnv.org.ua>

pkgname="amazonses"
_pkgname="AmazonSES"
pkgver="2011.03.03"
_pkgver=${pkgver//\./-}
pkgrel=3
pkgdesc="Amazon Simple Email Service Scripts."
arch=('any')
url="http://aws.amazon.com/developertools/8945574369528337"
license=('APACHE')
depends=('perl' 'perl-switch' 'perl-uri' 'perl-libwww' 'perl-crypt-ssleay' 'perl-xml-libxml')
makedepends=('unzip')
source=(http://aws-catalog-download-files.s3.amazonaws.com/${_pkgname}-${_pkgver}.zip)
noextract=('*')
md5sums=('cb8bf6ff2780c46f8f41c7fd172dbf44')

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
