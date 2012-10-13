pkgname=soundfont-ff4sf2
pkgver=20020718
pkgrel=1
pkgdesc="Final Fantasy 4 soundfont for MIDI playback"
arch=(any)
url="http://tssf.gamemusic.ca"
license=("Public Domain")
source=("ff4sf2.zip::http://www.zophar.net/download_file/3551")
md5sums=('76085551837ca23f4cdb7ae9796d9586')

package() {
 install -Dm644 "$srcdir/ff4sf2.sf2" "$pkgdir/usr/share/soundfonts/ff4sf2.sf2"
}
