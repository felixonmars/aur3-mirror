# Contributor: Gael Lane Lepine <galalep at gmail dot com>

pkgname=hybridreverb2
pkgver=2.0
pkgrel=1
pkgdesc="a convolution-based reverberation effect (VST plugin)"
arch=(i686)
url="http://www2.ika.rub.de/HybridReverb2/"
license=('GPL')
depends=(fftw alsa-lib)
makedepends=(deb2targz)
source=(http://www.kvraudio.com/developer_challenge/2009/dc09_27_hybridreverb2_2.0_small_Ubuntu_jaunty_i386.zip
http://www2.ika.rub.de/HybridReverb2/HybridReverb2_large_database.zip)
md5sums=('3861525f414abf6707555d4ae3c58f37'
         'd758571bc2e96a517b0e9757ad89c686')

build() {
  cd "$srcdir/"

  deb2targz hybridreverb2_2.0+small_Ubuntu_jaunty_i386.deb
  tar -zxvf hybridreverb2_2.0+small_Ubuntu_jaunty_i386.tar.gz

  cp -r "$srcdir/usr/" "$pkgdir/"
  rm -R "$pkgdir/usr/share/HybridReverb2/Vstplugins/"
  install -D "$srcdir/usr/share/HybridReverb2/Vstplugins/libHybridReverb2vst.so" "$pkgdir/usr/lib/vst/libHybridReverb2vst.so"
  cp -r "$srcdir/etc/" "$pkgdir/"
  cp -r RIR_Database "$pkgdir/usr/share/HybridReverb2"
  cp HybridReverb2_presets.xml "$pkgdir/usr/share/HybridReverb2/HybridReverb2_presets-2.xml"
}
