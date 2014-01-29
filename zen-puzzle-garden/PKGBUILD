# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Zachary A. Jones <JazzplayerL9@gmail.com>

pkgname=zen-puzzle-garden
pkgver=1.3
pkgrel=3
pkgdesc="Zen Puzzle Garden gently tests your ability to rake out an uninterrupted stone garden pattern."
url="http://www.lexaloffle.com/zen.htm"
license=('custom: commercial')
groups=('humblevoxatronbundle' 'humblebundles')
arch=('i686' 'x86_64')
depends=('sh' 'libgl' 'sdl')
optdepends=('alsa-lib: sound support'
            'libpulse: sound support')
if [ "$CARCH" == "x86_64" ]; then
  depends=('sh' 'lib32-libgl' 'lib32-sdl')
  optdepends=('lib32-alsa-lib: sound support'
              'lib32-libpulse: sound support')
fi
options=('!strip')
# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find $(echo %u | cut -c 7-). Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://${pkgname}_${pkgver}_i386.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('8ad69e4dee5aa5b5d6edd041bc158a7e5eb5e0b2b14ce3c7049a91edd0786d95'
            'b8bfb067705f1c9c0597c74d5942de344a7afe80a92381382ee9937c4172afab'
            'fe03231e8c66953a3f825d831f3d89fb2eab3fc466b470e811386f48bd15386f')

package(){
  # binary + data
  install -Dm755 $pkgname/zen "$pkgdir"/opt/$pkgname/zen
  install -m644 $pkgname/zen.dat "$pkgdir"/opt/$pkgname
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  # .desktop file and icon
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname/lexaloffle-zen.png "$pkgdir"/usr/share/icons/$pkgname.png
  # doc + license
  install -Dm644 $pkgname/$pkgname.txt "$pkgdir"/usr/share/doc/$pkgname/$pkgname.txt
  install -Dm644 $pkgname/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
