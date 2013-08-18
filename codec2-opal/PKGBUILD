# Maintainer: Dreieck
# Contributor: Jan de Groot <jan@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>
pkgname=codec2-opal
if pacman -Qq opal > /dev/null 2>/dev/null; then
  _opalver="$(pacman -Q opal | awk '{print $2}' | awk -F'-' '{print $1}')"
  msg "Informational: Installed version of package 'opal' is '${_opalver}'"
  msg "+-----------------------------------------------------------------------+"
  msg "| It may be needed to update the entry 'sha256sums'-array corresponding |"
  msg "| to the source for 'opal', since the source matching the installed     |"
  msg "| version will be used.                                                 |"
  msg "+-----------------------------------------------------------------------+"
else
  _opalver=""
  echo " +--------------------------------------------------------------------------+"
  echo " | This package depends on libopal and needs to know the installed version. |"
  echo " | Please install the package 'opal' first, then rebuild '${pkgname}'.      |"
  echo " |                                                                          |"
  echo " | It also may be neccessary to update the sha256 sum of the 'opal' source  |"
  echo " | in the PKGBUILD of '${pkgname}'.                                         |"
  echo " +--------------------------------------------------------------------------+"
fi
pkgver=9.00
pkgrel=2
pkgdesc="Provides codec2, a 2400 kbit/s speech codec, for libopal (which makes it available for e.g. ekiga VOIP software)."
arch=(i686 x86_64)
url="http://www.mungewell.org/Codec2/ReadMe.txt"
license=(MPL, LGPL)
if [ -n "${_opalver}" ]; then
  _opaldep="opal=${_opalver}" ## If opal is installed, then depend on the installed version of opal.
else
  _opaldep="opal"
fi
depends=("${_opaldep}")
makedepends=()
provides=()
replaces=()
conflicts=()
options=(!makeflags)
source=(http://ftp.gnome.org/pub/GNOME/sources/opal/${_opalver%.*}/opal-${_opalver}.tar.xz
        opal-ffmpeg.patch
        http://www.mungewell.org/Codec2/Codec2_libOpal.tar.gz
        http://www.mungewell.org/Codec2/ReadMe.txt)
sha256sums=('f208985003461b2743575eccac13ad890b3e5baac35b68ddef17162460aff864' # For opal version 3.10.10. Update to fit ${_opalver}.
            '0111eec3f7109a83f8cd4a87744ca050b3ca27482e9d31e3a1d50798f8cd88c1'
            '13c466a658b6aae500b173fc5a552e087b5fc9b94a1b75b1275f4923113ec429'
            'e463719cc7011c6d091cddb40fcdecfb687cf77168d62160d2b54d049f568025')

build() {
  cd "${srcdir}/opal-${_opalver}"
  patch -Np1 -i "${srcdir}/opal-ffmpeg.patch"
  
  msg "Extracting '${srcdir}/Codec2_libOpal.tar.gz' into libopal-source ..."
  tar --overwrite --overwrite-dir -xzf "${srcdir}/Codec2_libOpal.tar.gz"
  
  cd "${srcdir}/opal-${_opalver}/plugins"
  
  aclocal
  CXXFLAGS="$CXXFLAGS -fpermissive" \
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --enable-sbc \
    --enable-h264 \
    --enable-ixj \
    --enable-vpb \
    --enable-capi \
    --enable-spandsp
    
  cd "${srcdir}/opal-${_opalver}/plugins/audio/Codec2"
  make
}

package() {
  cd "${srcdir}/opal-${_opalver}/plugins/audio/Codec2"
  mkdir -p "${pkgdir}/usr/lib/opal-${_opalver}/codecs/audio/"
  install -m 644 codec2_audio_pwplugin.so "${pkgdir}/usr/lib/opal-${_opalver}/codecs/audio/codec2_audio_pwplugin.so"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 "${srcdir}/ReadMe.txt" "${pkgdir}/usr/share/doc/${pkgname}/ReadMe.txt"
}
