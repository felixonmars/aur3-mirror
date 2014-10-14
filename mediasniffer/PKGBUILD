# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="mediasniffer"
pkgver="1.0.0.13"
pkgrel="2"
pkgdesc="Sniff download links to media while using iTunes, websites with video, etc."
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/mediasniffer/"
license=("GPL")
depends=("curl" "libpcap" "libgnomeui" "gksu")
source=(
  "http://downloads.sourceforge.net/project/mediasniffer/linux-src/MediaSniffer-linux-src-$pkgver.tar"
  "mediasniffer.desktop"
)
sha1sums=(
  "1583933e3a0d86e1cad4442140418f3241bb45ff"
  "e64086e31fccbdecf080640d21369c300c885484"
)

build() {
  cd "$srcdir"
  make
}

package() {
  install -Dm 755 "$srcdir/mediasniffer" "$pkgdir/usr/bin/mediasniffer"
  install -Dm 644 "$srcdir/linux_gui/icon.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/mediasniffer.png"
  install -Dm 644 "$srcdir/mediasniffer.desktop" "$pkgdir/usr/share/applications/mediasniffer.desktop"
}
