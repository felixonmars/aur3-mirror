# Initial pkgbuild is taken from the original ABS branch.
# vte-common is stripped from it because there's no need
# to apply any changes to that particular package.
# The only addition is mosh_fix.patch, provided by
# https://bugzilla.gnome.org/show_bug.cgi?id=542087#c15
#
# This pkgbuild is supposed to be maintained until the patch
# is included in the original package or upstream.
# --
# Von
#
# Initial comment:
#
# $Id: PKGBUILD 196587 2013-10-15 14:50:39Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=vte3-mosh-fix
pkgver=0.34.9
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK3 with the fix for mosh applied"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!libtool' '!emptydirs')
depends=('gtk3' 'vte-common')
conflicts=('vte3')
provides=('vte3')
makedepends=('intltool' 'gobject-introspection' 'gtk3')
url="http://www.gnome.org"
source=(http://download.gnome.org/sources/vte/${pkgver::4}/vte-$pkgver.tar.xz
        mosh_fix.patch)
sha256sums=('6f38c5edf57d0a5b870c4e5e210731cccfb4899d0856ba7a3dc599f2ba6e23e1'
            '9a99c486b1c0377a4b8c6fae25067c68913bded2988fafea2c86f5adf6a49c81')

build() {
  cd "vte-$pkgver"
  patch -Np1 -i "$srcdir/mosh_fix.patch"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vte \
      --localstatedir=/var --disable-static \
      --enable-introspection
  make
}

package(){
  cd "vte-$pkgver"
  make DESTDIR="$pkgdir" install

  rm "$pkgdir"/usr/lib/vte/gnome-pty-helper
}
