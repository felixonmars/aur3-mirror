# Maintainer : EnteEnteEnte <ducksource@duckpond.ch>
# Original uploader: Pierre DOUCET <pierre at equinoxefr.org>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-dev"
pkgver="2.7.EA17H"
pkgrel=1
pkgdesc="DSO suite for bitscope oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=(atk gdk-pixbuf2 gtk2 pango cairo)

if [ "${CARCH}" == "x86_64" ]; then
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='0b8a7a73d219f6ea473c67730f656248be07656a'
else
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='5a032fa5bcd50aab162c891a59789155bd8069ce'
fi

_DSOPKG="bitscope-dso_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_DSOPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
