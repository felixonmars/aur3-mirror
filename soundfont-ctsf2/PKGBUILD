pkgname=soundfont-ctsf2
pkgver=20010302
pkgrel=1
pkgdesc="Chrono Trigger soundfont for MIDI playback"
arch=(any)
url="http://tssf.gamemusic.ca"
license=("Public Domain")
source=("ctsf2.zip::http://www.zophar.net/download_file/21755")
md5sums=('e92e517669bf1878d87f0522b56e08a4')

package() {
 install -Dm644 "$srcdir/CTinstruments.sf2" "$pkgdir/usr/share/soundfonts/CTinstruments.sf2"
}
