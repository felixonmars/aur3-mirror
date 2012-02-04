# Maintainer: Alexander Fehr <pizzapunk gmail com>

pkgname=pino
pkgver=0.2.11
pkgrel=3
pkgdesc="Fast, easy and free Twitter client"
arch=('i686' 'x86_64')
url="http://pino-app.appspot.com/"
license=('LGPL3')
depends=('libgee' 'libnotify' 'libwebkit' 'libunique' 'gtkspell' 'librsvg' 'hicolor-icon-theme')
makedepends=('vala' 'python2' 'intltool')
install=pino.install
source=(http://pino-twitter.googlecode.com/files/pino-$pkgver.tar.bz2
        pino.patch)
md5sums=('301c1443e5fab366b8e43b691a2db28f'
         'c71e9562c90f45d761f7bd80d8104a10')

build() {
  cd "$srcdir"/pino-0.2.10

  # Make pino build with Vala 0.12
  patch -Np1 -i "$srcdir"/pino.patch

  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "$srcdir"/pino-0.2.10

  python2 waf install --destdir=$pkgdir
}
