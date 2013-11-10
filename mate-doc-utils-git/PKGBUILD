# Maintainer: Perberos <perberos@gmail.com>
pkgname=mate-doc-utils-git
pkgver=0.r40.f04b3ab
pkgrel=1
pkgdesc="Documentation utilities for MATE"
url="https://github.com/mate-desktop/mate-doc-utils"
arch=('any')
license=('GPL' 'LGPL')
depends=('libxslt' 'python2' 'docbook-xml' 'rarian' 'gnome-doc-utils')
makedepends=('pkgconfig' 'intltool' 'mate-common-git')
provides=('mate-doc-utils')
conflicts=('mate-doc-utils')
options=('!emptydirs' '!libtool')
source=("git+${url}.git")
sha512sums=('SKIP')
groups=('mate')
_gitname=mate-doc-utils

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  PYTHON=/usr/bin/python2 ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --localstatedir=/var \
    --disable-scrollkeeper || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install || return 1
  # files with conflicts with gnome-doc-utils
  rm -rf "${pkgdir}/usr/share/xml/mallard/"
  rm "${pkgdir}/usr/share/pkgconfig/xml2po.pc"
  rm -rf "${pkgdir}/usr/share/man/"
  rm -rf "${pkgdir}/usr/lib/"
  rm "${pkgdir}/usr/bin/xml2po"
}
# vim:set ts=2 sw=2 bs=2:
