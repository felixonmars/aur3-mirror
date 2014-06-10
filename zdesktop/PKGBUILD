# Maintainer : Martin Wimpress <code@flexion.org>

pkgname="zdesktop"
pkgver="7.2.5"
_pkgver="7_2_5"
_build="b12038"
_pkgrel="20140417011642"
pkgrel="${_pkgrel}.1"
pkgdesc="Zimbra Desktop is the next-generation email and collaboration client."
arch=('i686' 'x86_64')
depends=('alsa-lib' 'xulrunner' 'gtk-engine-murrine' 'libcanberra')
url="http://www.zimbra.com/products/desktop.html"
license=('custom:ZP-EULA')
options=('!strip')
source=("http://files2.zimbra.com/downloads/zdesktop/${pkgver}/${_build}/${pkgname}_${_pkgver}_ga_${_build}_${_pkgrel}_linux_i686.tgz"
        "ZP-EULA")
sha1sums=('f44601d4cd3a2f7c2b29d03956c98c65602abb0e'
          '18bc29c51bd504615a0b945b754c4f4eeb6bef8d')
install=${pkgname}.install

if [ "${CARCH}" == "x86_64" ]; then
    depends=('lib32-alsa-lib' 'lib32-xulrunner' 'lib32-gtk-engine-murrine' 'lib32-libcanberra')
fi

package() {
    install -Ddm755 "${pkgdir}/opt/zimbra/zdesktop/"
    cp -a -p "${srcdir}"/${pkgname}_${_pkgver}_ga_${_build}_linux_i686/app/* "${pkgdir}"/opt/zimbra/zdesktop/
    install -D -m 644 ZP-EULA "${pkgdir}/usr/share/licenses/${pkgname}/ZP-EULA"
}
