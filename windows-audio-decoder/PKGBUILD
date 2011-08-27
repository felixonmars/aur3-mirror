# Created by dezza <dezzadk@gmail.com>
pkgname=windows-audio-decoder
pkgver=1
pkgrel=5
pkgdesc="Windows Audio Decoder DLL-files for wma/wmv (including version 9) audio playback."
arch=(i686)
url="http://www.dllbank.com"
license=('unknown')
depends=()
replaces=(codecs)
conflicts=(codecs)
source=(http://www.dllbank.com/zip/w/wma9dmod.dll.zip
	http://www.dllbank.com/zip/w/wmadmod.dll.zip)
md5sums=('2e06ee5921ddb319155a2b232f8301f0'
	 '99703352b84894989a8b73b4b5e65b60')

build() {
  mkdir -p $startdir/pkg/usr/lib/codecs
  install -m644 $startdir/src/*.dll ${startdir}/pkg/usr/lib/codecs/
}
