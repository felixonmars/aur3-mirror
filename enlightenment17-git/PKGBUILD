# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=enlightenment17-git
_pkgname=enlightenment
pkgver=0.17.99.17108.65a9f8d
pkgrel=1
pkgdesc="Enlightenment window manager (formerly e17) - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary-git' 'xcb-util-keysyms' 'hicolor-icon-theme'
         'desktop-file-utils' 'udisks2' 'ttf-font')
  [[ ! $(pacman -T "wayland>=1.2.90") ]] && depends+=('wayland>=1.2.90' 'pixman' 'mesa')
makedepends=('git')
optdepends=('connman: network module'
            'bluez-libs: bluetooth module')
provides=("enlightenment17=$pkgver" 'notification-daemon')
conflicts=("enlightenment17")
backup=('etc/enlightenment/sysactions.conf'
        'etc/xdg/menus/enlightenment.menu')
options=('!libtool' 'debug')
install=enlightenment17.install
source=("git://git.enlightenment.org/core/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for i in v_maj v_min v_mic; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  echo $_v_maj.$_v_min.$_v_mic.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-wayland-clients \
    --enable-wayland-egl

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
