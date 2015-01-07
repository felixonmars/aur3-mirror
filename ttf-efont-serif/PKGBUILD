pkgname=ttf-efont-serif
pkgver=20010312
pkgrel=2
pkgdesc="Attractive serif text font from the Electronic Font Open Laboratory"
arch=('any')
url="http://openlab.ring.gr.jp/efont/index.html.en"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=(http://openlab.ring.gr.jp/efont/dist/serif/efont-serif-$pkgver-win.zip)
noextract=(efont-serif-$pkgver-win.zip)
install=$pkgname.install
md5sums=('8557edf8d5cd16c126a81696406a8004')

package() {
  cd $srcdir/
  unzip -j efont-serif-$pkgver-win.zip *.ttf
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp *.ttf $pkgdir/usr/share/fonts/TTF
}

