pkgname=xkeyboard-config-glagolitic
_pkgname=xkeyboard-config
pkgver=2.0
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="http://www.freedesktop.org/wiki/Software/XKeyboardConfig"
depends=('xorg-xkb-utils')
makedepends=('intltool' 'pkgconfig')
provides=('xkbdata' 'xkeyboard-config')
replaces=('xkbdata')
conflicts=('xkbdata' 'xkeyboard-config')
source=(http://people.freedesktop.org/~svu/${_pkgname}-${pkgver}.tar.bz2
	glagolitic.patch)
md5sums=('bb8a98ee61cdc4bd835fdfd2b5cee3e6'
         '212cea3e548931fa0b353c397a8df4f6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p3 -i "${srcdir}"/glagolitic.patch

  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes
  make
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"
  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
