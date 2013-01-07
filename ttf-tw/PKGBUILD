# Maintainer: Ma Jiehong <ma.jiehong at gmail>
pkgname=ttf-tw
pkgver=3.0
pkgrel=2
pkgdesc="Set of KAI and SONG font from the Ministry of Education of Taiwan. These fonts follow all the official recommendations and their shapes are correct."
arch=('i686' 'x86_64')
url="http://www.moe.gov.tw/"
license=('CC-BY-ND 3.0')
depends=('fontconfig' 'xorg-font-utils' 'git')
conflicts=()
install=ttf.install

build() {
  cd "$srcdir"
  echo 'Fetching git repository…'
  git clone https://github.com/Jiehong/TW-fonts.git repo
  echo 'Installing fonts…'
  cp repo/edukai-3.ttf .
  cp repo/eduSong_Unicode.ttf .  
  install -Dm644 edukai-3.ttf "$pkgdir/usr/share/fonts/TTF/edukai-3.ttf"
  install -Dm644 eduSong_Unicode.ttf "$pkgdir/usr/share/fonts/TTF/eduSong_Unicode.ttf"
}

