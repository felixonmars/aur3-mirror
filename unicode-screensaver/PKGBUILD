# Contributor: Alexander Tsamutali <astsmtl@yandex.ru>

pkgname=unicode-screensaver
pkgver=0.4
pkgrel=1
pkgdesc="A simple screensaver that displays random unicode characters."
arch=('i686' 'x86_64')
url="http://www.joachim-breitner.de/projects"
license=('GPL')
depends=('libx11' 'libxmu' 'libxt' 'libxft' 'fontconfig')
optdepends=('xscreensaver: xscreensaver support'
            'gnome-screensaver: gnome-screensaver support')
source=(http://www.joachim-breitner.de/archive/unicode-screensaver/$pkgname-$pkgver.tar.gz
        LICENSE)
md5sums=('13bd844b60a4b79048aa3b397ecd4a24'
         '2d48ab76018fae7c88f0eff3e0b30bdf')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}
