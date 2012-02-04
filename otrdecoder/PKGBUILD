# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: buddabrod <buddabrod @ gmail.com>
# Contributor: Urs Wolfer <uwolfer @ fwo.ch>

pkgname=otrdecoder
pkgver=0.4.1132
pkgrel=6
pkgdesc="Decoder for .otrkey files from OnlineTvRecorder.com"
arch=('i686' 'x86_64')
url="http://www.onlinetvrecorder.com/"
license=('custom')
depends=('ffmpeg')
if [ "$CARCH" = "x86_64" ]; then
  source=(http://onlinetvrecorder.com/downloads/otrdecoder-bin-${CARCH}-unknown-linux-gnu-${pkgver}.tar.bz2)
  md5sums=('602638f318e5ee669cab17576d4a16b6')
else 
  source=(http://onlinetvrecorder.com/downloads/otrdecoder-bin-linux-Ubuntu_8.04-${CARCH}-${pkgver}.tar.bz2)
  md5sums=('e81d4d959c76cc7634f9829d88525c40')
fi
optdepends=('pygtk: Needed to run the GTK User Interface')

build() {
  mkdir -p ${pkgdir}/usr/{bin,lib,share/locale/de/LC_MESSAGES,share/licenses/${pkgname}}
  if [ "$CARCH" = "x86_64" ]; then
    cd ${srcdir}/otrdecoder-bin-${CARCH}-unknown-linux-gnu-${pkgver}
  else 
    cd ${srcdir}/otrdecoder-bin-linux-Ubuntu_8.04-${CARCH}-${pkgver}
  fi

  #enforce python2
  sed -i -e 's|#!\s*/usr/bin/python[^\d.]*$|#!/usr/bin/python2|' ${pkgname}-gui
  
  install -m755 otrdecoder ${pkgdir}/usr/bin/
  install -m755 otrdecoder-gui ${pkgdir}/usr/bin/
  install -m644 decoder.glade ${pkgdir}/usr/bin/
  install -m644 libavutil.so.49 ${pkgdir}/usr/lib/
  install -m644 libavformat.so.52 ${pkgdir}/usr/lib/
  install -m644 libavcodec.so.52 ${pkgdir}/usr/lib/
  install -m644 locale/de/LC_MESSAGES/otrdecoder.mo ${pkgdir}/usr/share/locale/de/LC_MESSAGES/
  install -m644 copyright ${pkgdir}/usr/share/licenses/${pkgname}/
} 

# vim:set ts=2 sw=2 et:
