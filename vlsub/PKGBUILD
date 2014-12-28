# Maintainer: Ner0

pkgname=vlsub
pkgver=0.9.13
pkgrel=1
pkgdesc="VLC extension that adds an option to download subtitles"
arch=('any')
url="http://addons.videolan.org/content/show.php?content=148752"
license=('GPL')
depends=('vlc')
source=('https://raw.github.com/exebetche/vlsub/master/vlsub.lua')
md5sums=('6fdc23762c6d21c1ee200cd4b6dcaad0')


package() {
  install -vDm644 "$srcdir/vlsub.lua" "$pkgdir/usr/share/vlc/lua/extensions/vlsub.lua"
}
