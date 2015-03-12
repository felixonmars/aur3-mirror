# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Nagy Gabor

pkgname=xcdroast-cdrecord
_real_pkgname=xcdroast
pkgver=0.98alpha16
pkgrel=2
pkgdesc="Lightweight cdrtools front-end for CD and DVD writing"
url="http://www.xcdroast.org/"
depends=('cdrtools' 'gtk2')
conflicts=(${_real_pkgname})
source=(${_real_pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/${_real_pkgname}/files/${_real_pkgname}/${pkgver}/${_real_pkgname}-${pkgver}.tar.gz/download
        cdda2wav_version.patch
        fix_cddb_hidden_tracks.patch
        io_compile.patch
        io_progressbar_fix.patch)
md5sums=('bc3d335a30f292067eaaf1ea03ebaf17'
         'ace2a147f52a317dd301131fe60ce755'
         '0f5c3c6d8ddfe2e31305200420d48a1d'
         '6e676e94e8b6922ed3e2d0feef05fd60'
         '09864000d7c9717684f13d32dae40e96')
license=('GPL')
arch=('i686' 'x86_64')

prepare() {
  cd "${srcdir}"/${_real_pkgname}-${pkgver}
  cp "${srcdir}"/*.patch "${srcdir}"/${_real_pkgname}-${pkgver}
  patch -Np1 -i cdda2wav_version.patch
  patch -Np0 -i fix_cddb_hidden_tracks.patch
  patch -Np0 -i io_compile.patch
  patch -Np0 -i io_progressbar_fix.patch
}  

build() {
  cd "${srcdir}"/${_real_pkgname}-${pkgver}
  ./configure --prefix="/usr" \
              --sysconfdir="/etc" \
              --mandir="/usr/share/man" \
              --enable-gtk2 \
              --enable-nonrootmode \
              --disable-dependency-tracking
  make
}

package() {
  cd "${srcdir}"/${_real_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rmdir "${pkgdir}"/etc
  install -Dm644 "${srcdir}"/${_real_pkgname}-${pkgver}/extra/xcdroast.desktop "${pkgdir}"/usr/share/applications/xcdroast.desktop
  echo "Categories=AudioVideo;DiscBurning;" >> "${pkgdir}"/usr/share/applications/xcdroast.desktop
}
