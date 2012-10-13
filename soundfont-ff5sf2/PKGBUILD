pkgname=soundfont-ff5sf2
pkgver=19980929
pkgrel=1
pkgdesc="Final Fantasy 5 soundfont for MIDI playback"
arch=(any)
url="http://tssf.gamemusic.ca"
license=("Public Domain")
source=("ff5sf2.zip::http://www.zophar.net/download_file/13202")
md5sums=('6ef3e6972aa16cc8c6edb85e57eb038a')

package() {
 install -Dm644 "$srcdir/FF5.sf2" "$pkgdir/usr/share/soundfonts/FF5.sf2"
}
