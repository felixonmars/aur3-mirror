# Maintainer: Carl Mueller  arch at carlm e4ward com
# Maintainer: Dedy MS at martadinata666@gmail.com
# Contributor: Armin K.  krejzi at email dot com
# Contributor: Gaetan Bisson  bisson at archlinux dot org
# Contributor: Austin   doorknob60 at gmail dot com

pkgname=broadcom-wl-lts
pkgver=6.30.223.248
pkgrel=1
pkgdesc='Broadcom 802.11abgn hybrid Linux networking device driver for linux-lts'
url='http://www.broadcom.com/support/802.11/linux_sta.php'
arch=('i686' 'x86_64')
license=('custom')
depends=('linux-lts-headers')
makedepends=('linux-lts-headers')
[[ $CARCH = x86_64 ]] && _arch=_64 || _arch=
source=("http://www.broadcom.com/docs/linux_sta/hybrid-v35${_arch}-nodebug-pcoem-${pkgver//./_}.tar.gz"
        'modprobe.d'
        'license.patch'
        'linux-recent.patch'
        'gcc.patch')
        
sha256sums=('b196543a429c22b2b8d75d0c1d9e6e7ff212c3d3e1f42cc6fd9e4858f01da1ad'
            'b4aca51ac5ed20cb79057437be7baf3650563b7a9d5efc515f0b9b34fbb9dc32'
            '24d02018e4e5b90516ba3e98bd957ad91e758944c8a21e22d56a516f2361c6f9'
            'f651681496316ac60b5f2d37c93a36b3a4a1ee29ab6aada6eebaef7f7c1f1d02'
            '1452ff8d711fb1087e663a85412fdee58cdccff3a14677b9e88690ccea9f6105')
            
[[ $CARCH = x86_64 ]] && sha256sums[0]='3d994cc6c05198f4b6f07a213ac1e9e45a45159899e6c4a7feca5e6c395c3022'

backup=("etc/modprobe.d/${pkgname}.conf")
install=install

_kernmajor="$(pacman -Q linux-lts | awk '{print $2}' | cut -d - -f1 | cut -d . -f1,2)"
_extramodules="extramodules-${_kernmajor}-lts"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

prepare() {
	cd "${srcdir}"

	#patch -p1 -i linux-recent.patch
	patch -p1 -i license.patch
    patch -p1 -i gcc.patch

    sed -e "/BRCM_WLAN_IFNAME/s:eth:wlan:" -i src/wl/sys/wl_linux.c

}

build() {
	cd "${srcdir}"

	make -C /usr/lib/modules/${_kernver}/build M=`pwd`
}

package() {
	cd "${srcdir}"

	install -D -m 644 wl.ko "${pkgdir}/usr/lib/modules/${_extramodules}/wl.ko"
	gzip "${pkgdir}/usr/lib/modules/${_extramodules}/wl.ko"

	install -D -m 644 lib/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 644 modprobe.d "${pkgdir}/etc/modprobe.d/${pkgname}.conf"
}
