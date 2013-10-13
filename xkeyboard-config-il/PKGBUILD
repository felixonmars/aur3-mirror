# Maintainer: Jan de Groot <jgc@archlinux.org>
# il - new SI1452: Yoel Lion <yoel3ster@gmail.com>
pkgname=xkeyboard-config-il
pkgbasename=xkeyboard-config
pkgver=2.10.1
pkgrel=1
pkgdesc="X keyboard configuration files with new SI1452 layout patch"
arch=(any)
license=('custom')
url="http://www.freedesktop.org/wiki/Software/XKeyboardConfig"
depends=('xorg-xkbcomp')
makedepends=('intltool')
provides=('xkeyboard-config' 'xkbdata')
replaces=('xkeyboard-config' 'xkbdata')
conflicts=('xkeyboard-config' 'xkbdata')
source=(http://xorg.freedesktop.org/archive/individual/data/${pkgbasename}/${pkgbasename}-${pkgver}.tar.bz2
        il.patch extra.patch)
sha256sums=('7d58064d86bb0155a3acc4ca35097dab4dfef334cdd0555fb5965ebca1fca18b'
            '8724e737f381464eccb7f7bd07464249ae3b81396f8b6437c7e8088bc1b58856'
            'a3910232a45b9bca6a4239d431a109ff83e7d1d21719f8295ab6f4ffff9b79ed')

prepare() {
  cd "${srcdir}/${pkgbasename}-${pkgver}"
  patch -Np1 -i "${srcdir}/il.patch"
  patch -Np1 -i "${srcdir}/extra.patch"
}

build() {
  cd "${srcdir}/${pkgbasename}-${pkgver}"
  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes
  make
}

package() { 
  cd "${srcdir}/${pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"
  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
