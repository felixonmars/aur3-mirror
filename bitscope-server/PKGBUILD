# Maintainer : EnteEnteEnte <ducksource@duckpond.ch>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-server"
pkgver="1.0.EA20A"
pkgrel=1
pkgdesc="Bitscope server software for oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=()

if [ "${CARCH}" == "x86_64" ]; then
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='887637d5c81d3dbfedb13e025899555a0a9a004a'
else
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='2836e1baf74ea2fbb73e9cc23b7ce832ee1ab598'
fi

_SERVERPKG="bitscope-server_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_SERVERPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
