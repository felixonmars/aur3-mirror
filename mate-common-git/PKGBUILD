# Maintainer: Perberos <perberos@gmail.com>
pkgname=mate-common-git
pkgver=0.r40.185a881
pkgrel=1
pkgdesc="Common development macros for MATE"
arch=('any')
license=('GPL')
depends=('sh')
makedepends=('git')
provides=('mate-common')
conflicts=('mate-common')
options=('!libtool')
url="https://github.com/mate-desktop/mate-common"
groups=('mate')
source=("git+${url}.git")
sha512sums=('SKIP')
_gitname=mate-common

pkgver() {
  cd "$srcdir/${_gitname}"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_gitname}"
  ./autogen.sh \
    --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="${pkgdir}" install || return 1

  ln -s mate-autogen ${pkgdir}/usr/bin/mate-autogen.sh
}

# vim:set ts=2 sw=2 bs=2:
