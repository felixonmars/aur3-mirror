# Maintainer: Magnus Müller <stiffy2 @ gmx at de>
pkgname=msc
pkgver=1.1.1
pkgrel=1
pkgdesc="Generate ASCII MSC from a textual description"
arch=(i686 x86_64)
url="https://launchpad.net/ubuntu/hardy/+source/msc/1.1.1-2"
license=('gpl')
depends=(docbook-xsl python2 python2-pyparsing)
patches=(
    0001-Fix-variable-name.patch
    0002-Fix-python-version.patch
    0003-Exit-hard-when-parsing-errors-occur.patch
    0004-Preinitialize-task-variable.patch
)
source=(
    https://launchpad.net/ubuntu/dapper/+source/msc/1.1.1-2/+files/${pkgname}_${pkgver}.orig.tar.gz
)
source=(${source} ${patches[@]})
md5sums=(
    81a08a22b20782bb1052d0104f5cbc78
    5071a902adb3bda8b03148e537967d5a
    d4d884fcbbc7eb1cf37215305ec8b1c3
    2d107ec61e0be0691c5f03bbca4297fc
    f1b505078f4ee9fbfde9d59ce7a1e597
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}.orig"

    msg "patching.."
    for patch in "${patches[@]}"
    do
        patch -p1 -i ${srcdir}/${patch}
    done

    make DB2MAN=/usr/share/xml/docbook/xsl-stylesheets-1.78.1/manpages/docbook.xsl
    install -d ${pkgdir}/usr/bin/
    install -Dm755 ${srcdir}/${pkgname}-${pkgver}.orig/msc ${pkgdir}/usr/bin || return 1

    install -d ${pkgdir}/usr/share/man/man1
    gzip -f ${srcdir}/${pkgname}-${pkgver}.orig/msc.1
    install -Dm644 ${srcdir}/${pkgname}-${pkgver}.orig/msc.1.gz ${pkgdir}/usr/share/man/man1
}
