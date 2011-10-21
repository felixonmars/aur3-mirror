# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
pkgname=qm-vamp-plugins
pkgver=1.7
pkgrel=1
pkgdesc="Audio feature extraction plugins from Queen Mary, University of London"
arch=("i686" "x86_64")
url="http://isophonics.net/QMVampPlugins"
license=("GPL")
depends=("vamp-plugin-sdk" "cblas")
source=("https://code.soundsoftware.ac.uk/attachments/download/109/${pkgname}-${pkgver}.tar.gz"
        "https://code.soundsoftware.ac.uk/attachments/download/103/qm-dsp-${pkgver}.tar.gz")
sha256sums=("2ef72ef57a582c335ab82d2b81a28a623409e31715009a32e0b9922fd296e80b"
            "0d80be029f9a3d25345940bdd1691d1c4439d97f54e15cb27a29475825885f02")

build() {
  cd "$srcdir"

  msg 'Building the QM DSP library'
  ln -s "qm-dsp-${pkgver}" qm-dsp
  cd qm-dsp
  sed -i "19a#include <stdlib.h>"  dsp/tempotracking/DownBeat.h   
  sed -i "20a#include <stdlib.h>"  dsp/tempotracking/TempoTrackV2.h
  sed -i 's#^CFLAGS.*$#& -I./include#' build/general/Makefile.inc
  make -f build/linux/Makefile.linux

  msg 'Building the QM Vamp plugin'
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/\s*-\S*\(sse\|-B\)\S*//g' build/linux/Makefile.linux
  sed -i 's/\s*-\S*qm-dsp\S*/ -shared -Wl,-Bstatic& -Wl,-Bdynamic/' build/linux/Makefile.linux
  make -f build/linux/Makefile.linux
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/lib/vamp"
  install -m755 -t "${pkgdir}/usr/lib/vamp" "${pkgname}.so"
  install -m644 -t "${pkgdir}/usr/lib/vamp" "${pkgname}."{cat,n3}
}

# vim:set ts=2 sw=2 et:
