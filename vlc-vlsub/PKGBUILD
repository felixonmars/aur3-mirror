# Maintainer: 3ED_0 <krzysztof1987/at/gmail/dot/com>

pkgname=vlc-vlsub
pkgver=0.9.10
# That commit ID is equal to pkgver!
_commit=2520c6b5cc51051cc15bb5b63db69c758d7f9044
pkgrel=2
pkgdesc='download subtitles from opensubtitles.org using hash or title of the currently playing video'
arch=('any')
url='http://addons.videolan.org/content/show.php?content=148752'
license=('GPL')
depends=('vlc' 'lua')
options=(!emptydirs)
source=(https://raw.github.com/exebetche/vlsub/$_commit/vlsub.lua)
sha256sums=('c77d85adc5183abd1897dbcb6c38038887423d22f9363651aeb9bb43f89acd90')

package() {
  _DESTDIR="$pkgdir/usr/lib/vlc/lua/extensions/"
  install -dm755 "$_DESTDIR"
  install -m644 vlsub.lua "$_DESTDIR"
}

