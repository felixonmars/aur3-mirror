# Maintainer: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Tomohiro Takezawa <khabus {at} gmail.com>

pkgbase='cndrvcups-lips4-cpca'
_pkgbase='cndrvcups-lips4'
pkgname=('cndrvcups-lips4-cpca')
pkgver=2.90
pkgrel=2
pkgdesc="cpca module for Canon LIPS4 driver"
arch=(x86_64)
license=('GPL2' 'custom')
url="http://cweb.canon.jp/drv-upd/lasershot/linux/lipssource.html"
depends=('libcups' 'cndrvcups-common-lb')
source=(linux-lips4-sources-v290.tar.gz::'http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNDE2MzA3&cmp=ACM&lang=EN')
options=('!emptydirs' '!strip' '!libtool')
sha512sums=('4ce320662f104aef94608d9cdb2f65d6def825d8e9e514f588a1a54fa4d87576c76dfe0a64300215de77cd66a3d26fb727dc552a18f55b3448acc06a34fdb721')

# build instructions are adapted from upstream cndrvcups-lips4.spec file

prepare() {
    cd "${srcdir}"/linux-lips4-sources-v290/Sources
    tar xf "${_pkgbase}"-"${pkgver}"-1.tar.gz -C "${srcdir}"
}

package_cndrvcups-lips4-cpca() {
    
    cd "${srcdir}"/"${_pkgbase}"-"${pkgver}"/cpca
    autoreconf -fi
    ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --libdir=/usr/lib

    make
    mkdir -p "${pkgdir}"/usr/{include,lib}
    make install DESTDIR="${pkgdir}"
    
    install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -m644 "${srcdir}"/"${_pkgbase}"-"${pkgver}"/LICENSE-lips4-"${pkgver}".txt "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
