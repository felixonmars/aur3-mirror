# Maintainer: Perberos <perberos@gmail.com>
pkgname=mate-desktop-git
pkgver=0.r193.793ca2d
pkgrel=1
pkgdesc="Library with common API for various MATE modules"
url="https://github.com/mate-desktop/mate-desktop"
arch=(i686 x86_64)
license=(GPL LGPL)
depends=('libunique' 'libnotify' 'hicolor-icon-theme' 'gvfs' 'obexd-client')
makedepends=('mate-doc-utils' 'intltool')
options=('!emptydirs' '!libtool')
provides=('mate-desktop')
conflicts=('mate-desktop')
groups=('mate')
install=mate-desktop.install
source=("git+${url}.git")
sha512sums=('SKIP')
_gitname=mate-desktop

pkgver() {
  cd "$srcdir/${_gitname}"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-scrollkeeper \
    --disable-startup-notification \
    --enable-unique || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 bs=2: 
