# Maintainer: Borja Ruiz <borja@libcrack.so>
# PKGBUILD adapted from dcpj925dw by Rene Rasmussen <madeye@paranoidix.dk>
_model=dcpj552dw
pkgname="brother-${_model}"
pkgver=3.0.0
pkgrel=1
pkgdesc="Brother cups and lpd driver for DCP-J552DW"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:Brother Industries')
depends=('lib32-glibc' 'cups' 'a2ps')
makedepends=('rpmextract')
install=brother-${_model}.install
arch=('i686' 'x86_64')
md5sums=('63842cf3efbf87a25f85f77b841b6dd7'
         'a0478abfe85516e7b02993f2ed041da1')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_model}cupswrapper-${pkgver}-${pkgrel}.i386.rpm"
        "http://www.brother.com/pub/bsc/linux/dlf/${_model}lpr-${pkgver}-${pkgrel}.i386.rpm")

build() {
 cd "$srcdir"
}

post_install() {
	/opt/brother/Printers/${_model}/cupswrapper/cupswrapper${_model}
}

package() {
    install -d $pkgdir/usr/bin
    install -d $pkgdir/var/spool/lpd
    install -Dm755 "${srcdir}/usr/bin/brprintconf_${_model}" "${pkgdir}/usr/bin/"
    cp -R "${srcdir}/opt" "${pkgdir}/opt"
}
