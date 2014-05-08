# Maintainer: /dev/rs0 <rs0@secretco.de.com>

pkgname=joomscan
pkgver=2012_03_10
pkgrel=1
pkgdesc="Detects file inclusion, sql injection, command execution vulnerabilities of a target Joomla! web site."

arch=('any')
license=('LGPL3')
url="http://$pkgname.sourceforge.net/"

depends=('perl-switch' 'perl-www-mechanize')

source=(
    "joomscan.sh"
    "http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver//_/-}/${pkgname}-latest.zip"
)
md5sums=(
    '0894326ec01c0cf702ea0f76051cf806'
    '82a8610dbee65bc587c05870910b545d'
)


package() {
    install -d ${pkgdir}/usr/{bin,share/{,doc}/${pkgname}}
    install -Dm0755 ${srcdir}/${pkgname}.{sh,pl} ${pkgdir}/usr/share/${pkgname}
    install -Dm0644 ${srcdir}/${pkgname}db{,-info}.txt ${pkgdir}/usr/share/${pkgname}

    cp -r ${srcdir}/report ${pkgdir}/usr/share/${pkgname}
    cp -r ${srcdir}/doc/* ${pkgdir}/usr/share/doc/${pkgname}

    ln -s /usr/share/${pkgname}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
