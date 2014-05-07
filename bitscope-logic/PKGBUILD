# Maintainer : EnteEnteEnte <ducksource@duckpond.ch>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-logic"
pkgver="1.2.DJ20C"
pkgrel=1
pkgdesc="Bitscope logic software for oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=(atk gdk-pixbuf2 gtk2 pango cairo)

if [ "${CARCH}" == "x86_64" ]; then
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='366df5c8a2d03b6a5cf5de34dfcccc688487833f'
else
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='c800a98c1d80374d5e410a4a86277ddf586f3ec4'
fi

_DSOPKG="bitscope-logic_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_DSOPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
