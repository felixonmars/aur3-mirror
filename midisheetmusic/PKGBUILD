pkgname=midisheetmusic
pkgver=2.6
pkgrel=1
pkgdesc=" Midi Sheet Music is a free program that plays MIDI music files while highlighting the piano notes and sheet music notes."
url=http://midisheetmusic.sourceforge.net/
arch=(i686 x86_64)
license=(GPL)
depends=(mono alsa-utils timidity++)

source=(http://downloads.sourceforge.net/project/midisheetmusic/midisheetmusic/$pkgver/midisheetmusic-$pkgver-linux.ubuntu.deb)
md5sums=('1c0df02b0d50b1ab88d855ce0ebe4759')
package() {
  tar -xf data.tar.gz -C "$pkgdir" ./usr
}

