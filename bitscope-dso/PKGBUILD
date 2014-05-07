# Maintainer : EnteEnteEnte <ducksource@duckpond.ch>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-dso"
pkgver="2.6.EA17H"
pkgrel=1
pkgdesc="Bitscope dso software for oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=(atk gdk-pixbuf2 gtk2 pango cairo)

if [ "${CARCH}" == "x86_64" ]; then
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='b98bcd2e4ee403440ea40708204809924957b0bc'
else
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='1e50ea8f135e6ea7edb1238c2a1c770289d47f67'
fi

_DSOPKG="bitscope-dso_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_DSOPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
