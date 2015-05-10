pkgname=d2x-xl-data-hd
pkgver=1
pkgrel=1
pkgdesc="High resolution D2X-XL data"
arch=(any)
url="http://www.descent2.de"
license=("custom" "Public Domain")
depends=(d2x-xl-data)
makedepends=(p7zip)
source=("http://www.descent2.de/files/models/hires-models.7z"
"http://www.descent2.de/files/textures/D2-textures-256x256.7z"
"http://www.descent2.de/files/textures/D1-textures-256x256.7z"
"http://www.descent2.de/files/sound/hires-sounds.7z"
"http://www.descent2.de/files/music/D1-music.7z"
"http://www.descent2.de/files/music/D2-music.7z")
sha1sums=('3d8ba2b65c3010fd6128cfe02b5cc20822a8fc45'
          '10925da964f9ed1c95d3da74b83fb8a957df24b2'
          '7f2151d7e9cc81473bb0931554d83104ca9a5d37'
          '199c6aacf52091362d43cac9fc94bca31d053ae9'
          'ba7206b1c27bab7ad622c9547026d503a94cbde4'
          '459069c83378d702531c6635265c8d6a397043e5')

package() {
	mv textures/D1 textures/d1
	find . -type f -not -name '*.7z' -not -name '*.txt' | xargs -I {} install -Dm644 {} "$pkgdir/opt/d2x-xl/"{}
	find "$pkgdir" -name '*.txt' -exec rm {} \;
}
# vim:syntax=sh
