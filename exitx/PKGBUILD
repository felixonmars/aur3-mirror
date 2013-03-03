# Maintainer: GunsNRose <3444542@163.com>
# Contributor: GunsNRose <3444542@163.com>

pkgname=exitx
pkgver=1.2
pkgrel=3
pkgdesc="exitx is exit X for openbox"
arch=('i686' 'x86_64')
url="http://www.linuxsir.com/bbs/lastpostinthread350740.html"
license=('GPL2')
depends=('gtk2' 'gettext' 'pm-utils')
source=(
    "http://cfgrepo.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2"
    "${pkgname}_zh_CN.mo"
    "${pkgname}_en_US.mo"
    "${pkgname}_en_us.patch"
)
install=${pkgname}.install

build() {
	#cd $startdir/src/${pkgname}-${pkgver}
	cd $startdir/src/${pkgname} || return 1
    patch -Np1 -i ${startdir}/${pkgname}_en_us.patch || return 1
    make || return  1
    install -Dm755 ${pkgname}  ${pkgdir}/usr/bin/${pkgname} || return 1
    install -Dm755 ${startdir}/${pkgname}_en_US.mo  ${pkgdir}/usr/share/locale/en_US/LC_MESSAGES/${pkgname}.mo || return 1
    if [ -d /usr/share/locale/zh_CN/LC_MESSAGES ] ; then
        install -Dm755 ${startdir}/${pkgname}_zh_CN.mo  ${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES/${pkgname}.mo || return 1
    fi
}
md5sums=('c53d3235361e87a2aef04b47dc4d9f5c'
         '8e230a2dd6258bcebc54bf3daffb12ee'
         'f78e16431ad4b13db5c9df9497785ee0'
         '2bdb7a9ec0d0fb8dc94f72c5af74c48f')
