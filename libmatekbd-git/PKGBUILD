# Maintainer: Perberos <perberos@gmail.com>
pkgname=libmatekbd-git
pkgver=0.r48.2163107
pkgrel=1
pkgdesc="MATE keyboard library"
url="https://github.com/mate-desktop/libmatekbd"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libxklavier' 'mate-conf-git')
makedepends=('git' 'intltool' 'pkgconfig')
groups=('mate')
provides=('libmatekbd')
conflicts=('libmatekbd')
options=('!emptydirs' '!libtool')
install=libmatekbd.install
source=("git+${url}.git")
sha512sums=('SKIP')
_gitname=libmatekbd

pkgver() {
  cd "$srcdir/$_gitname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/mateconf/schemas"
  mateconf-merge-schema \
		"${pkgdir}/usr/share/mateconf/schemas/${pkgname}.schemas" \
		--domain ${pkgname} ${pkgdir}/etc/mateconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/mateconf/schemas/*.schemas
}
# vim:set ts=2 sw=2 bs=2:
