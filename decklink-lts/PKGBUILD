# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Maintainer: Cian Mc Govern <cian@cianmcgovern.com>

pkgname=decklink-lts
pkgver=10.3.5
pkgrel=1
pkgdesc="Drivers for Blackmagic Design DeckLink, Intensity or Multibridge video editing cards"
arch=('i686' 'x86_64')
url="https://www.blackmagicdesign.com/support"
license=('custom')
depends=('libxml2' 'linux-lts' 'mesa' 'qt4' 'libpng')
makedepends=('linux-lts-headers')
conflicts=('decklink')
options=('!strip')
install='decklink-lts.install'
source=("Blackmagic_Desktop_Video_Linux_${pkgver}.tar.gz"
        'decklink.conf')
md5sums=('8c88a6374695a418007027df0c2680db'
         '4f2033439305c4ce8e9d50f55d5c46d8')

_mever=3.3.2
_dva=5
_mea=3
_dv="desktopvideo-${pkgver}a${_dva}-${CARCH}"
_me="mediaexpress-${_mever}a${_mea}-${CARCH}"
_kernver=3.14

prepare() {
  tar zxf "${srcdir}/DesktopVideo_${pkgver}/other/${CARCH}/${_dv}.tar.gz"
  tar zxf "${srcdir}/MediaExpress_${_mever}/other/${CARCH}/${_me}.tar.gz"
}

build() {
  cd "${srcdir}/${_dv}/usr/src/blackmagic-${pkgver}a${_dva}"
  make
  cp -dpr --no-preserve=ownership "${srcdir}/${_dv}/usr/src/blackmagic-${pkgver}a${_dva}/blackmagic.ko" "${srcdir}"
  make clean

  cd "${srcdir}/${_dv}/usr/src/blackmagic-io-${pkgver}a${_dva}"
  make
  cp -dpr --no-preserve=ownership "${srcdir}/${_dv}/usr/src/blackmagic-io-${pkgver}a${_dva}/blackmagic-io.ko" "${srcdir}"
  make clean
}

package() {
  # license
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/desktopvideo/License.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # automatic module loading
  install -D -m 0644 "${srcdir}/decklink.conf" "${pkgdir}/etc/modules-load.d/decklink.conf"
  install -D -m 0644 "${srcdir}/blackmagic.ko" "${pkgdir}/usr/lib/modules/extramodules-${_kernver}-lts/blackmagic.ko"
  install -D -m 0644 "${srcdir}/blackmagic-io.ko" "${pkgdir}/usr/lib/modules/extramodules-${_kernver}-lts/blackmagic-io.ko"

  cp -dpr --no-preserve=ownership "${srcdir}/${_dv}/etc" "${pkgdir}"
  cp -dpr --no-preserve=ownership "${srcdir}/${_dv}/usr" "${pkgdir}"
  mv "${pkgdir}/usr/sbin/DesktopVideoHelper" "${pkgdir}/usr/bin/"
  rm -r "${pkgdir}/usr/sbin/"

  cp -dpr --no-preserve=ownership "${srcdir}/${_me}/usr" "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
