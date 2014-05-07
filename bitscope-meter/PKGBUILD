# Maintainer : EnteEnteEnte <ducksource@duckpond.ch>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-meter"
pkgver="2.0.DK05B"
pkgrel=1
pkgdesc="Bitscope meter software for oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=(atk gdk-pixbuf2 gtk2 pango cairo)

if [ "${CARCH}" == "x86_64" ]; then
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='f8c18747e612d098ec43bb193c7e34cab6f23c4f'
else
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='79ab7519484d2ebd87dcd933c709c89e6be1a529'
fi

_METERPKG="bitscope-meter_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_METERPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
