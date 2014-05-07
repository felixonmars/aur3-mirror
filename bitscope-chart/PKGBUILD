# Maintainer : EnteEnteEnte <ducksource@duckpond.ch>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-chart"
pkgver="1.1.DK05B"
pkgrel=1
pkgdesc="Bitscope chart software for oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=(atk gdk-pixbuf2 gtk2 pango cairo)

if [ "${CARCH}" == "x86_64" ]; then
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='b68897a828f00fc7a0ac3aa953d91384194c1057'
else
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='1d0e90bb5fd03d1c32b8e9dcc122bb464f56340e'
fi

_CHARTPKG="bitscope-chart_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_CHARTPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
