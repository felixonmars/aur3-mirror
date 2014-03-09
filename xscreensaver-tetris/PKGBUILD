# Maintainer: Vivien HENRIET <bubuabu@bubuabu.org>

pkgname=xscreensaver-tetris
pkgver=5.26
pkgrel=1
pkgdesc="Tetris screen saver for xscreensaver"
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('GPL')
depends=('xscreensaver')
makedepends=('bc' 'libxpm')
source=(http://www.jwz.org/xscreensaver/${pkgname%%-*}-${pkgver}.tar.gz
xscreensaver-tetris.diff)
sha256sums=('2ca4dc66e11947396124d1f87dd2787e0d8dd8dd1ada8871b3d8df40fb4f1b55'
            'dca17a51d4c2e2b36645885dca838389d7508ab8276d6c877a227e8198fbd64c')

prepare() {
  cd "${pkgname%%-*}-${pkgver}"
  patch -p1 -N -i "${srcdir}/xscreensaver-tetris.diff"
}

build() {
  cd "${pkgname%%-*}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults \
    --with-pam --with-login-manager --with-gtk --with-gl \
    --without-gle --with-pixbuf --with-jpeg
  make
}

package() {
  cd "${pkgname%%-*}-${pkgver}"
  install -D -c ./hacks/glx/tetris ${pkgdir}/usr/lib/xscreensaver/tetris
  install -D -c -m 644 ./hacks/config/tetris.xml ${pkgdir}/usr/share/xscreensaver/config/tetris.xml
  install -D -c -m 644 ./hacks/glx/tetris.man ${pkgdir}/usr/share/man/man6/tetris.6
#  install -D -c -m 644 ./driver/XScreenSaver.ad ${pkgdir}/usr/share/X11/app-defaults/XScreenSaver
}
