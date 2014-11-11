# Maintainer: Eric Swanson <eswanson@alloscomp.com>

pkgname=accountsservice-git
pkgver=0.6.29.r0.g6e61c50
pkgrel=1
pkgdesc="D-Bus interface for user account query and manipulation (git version)"
arch=(i686 x86_64)
url="http://www.freedesktop.org/software/accountsservice/"
license=('GPL3')
groups=()
depends=('glib2' 'polkit' 'systemd')
makedepends=('git' 'intltool' 'gobject-introspection' 'python2')
provides=('accountsservice')
conflicts=('accountsservice')
replaces=()
backup=()
options=()
install=
source=(${pkgname}::git+https://github.com/mmonaco/accountsservice#branch=master)
noextract=()
md5sums=('SKIP'
    ) #generate with 'makepkg -g'


pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    # Only uses annotated tags to derive a version number,
    # add --tags to use un-annotated tags as well
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"

  ./autogen.sh

  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/accountsservice \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --localstatedir=/var --disable-static --enable-systemd

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
