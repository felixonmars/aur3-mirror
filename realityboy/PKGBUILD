# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=realityboy
pkgver=0.84
pkgrel=1
pkgdesc="The one and only emulator of Nintendo's Virtual Boy console"
arch=('i686' 'x86_64')
url="http://www.goliathindustries.com/vb/"
license=('custom')
depends=('allegro' 'gcc-libs')
makedepends=('gcc34')
source=(http://www.goliathindustries.com/vb/download/emu/rboy_084_src.zip \
	LICENSE)
md5sums=('38bfe12d32ac868bd808e378c95a6aff'
         '0ca9ba3ed006d95eb7b600658521266e')

build() {
  cd linux

  # overriding cflags to avoid 3.4 erroring out due to march parameter
  make	CC=g++-3.4 \
	WFLAGS= \
	OFLAGS="-O2" \
	|| return 1

  install -Dm755 rboy_linux "$pkgdir"/usr/bin/$pkgname
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
