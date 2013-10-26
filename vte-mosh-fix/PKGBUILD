# Initial pkgbuild is taken from the original ABS branch.
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
# $Id: PKGBUILD 188481 2013-06-14 22:21:14Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=vte-mosh-fix
pkgver=0.28.2
pkgrel=3
pkgdesc="Virtual Terminal Emulator widget for use with GTK2 with the fix for mosh applied"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!libtool' '!emptydirs')
depends=('gtk2' 'vte-common')
conflicts=('vte')
provides=('vte')
makedepends=('pygtk' 'intltool' 'gobject-introspection' 'pygobject2-devel')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/GNOME/sources/vte/0.28/vte-$pkgver.tar.xz
        make_alt_work.patch
        mosh_fix.patch)
sha256sums=('86cf0b81aa023fa93ed415653d51c96767f20b2d7334c893caba71e42654b0ae'
            '978c989fb63884289068bcee05a92614a3a2be9e5d9386ab789dfb87163b92c8'
            '9a99c486b1c0377a4b8c6fae25067c68913bded2988fafea2c86f5adf6a49c81')

build() {
  cd "$srcdir/vte-$pkgver"
  #warning: type-punning to incomplete type might break strict-aliasing rules
  export CFLAGS="$CFLAGS -fno-strict-aliasing"

  patch -Np1 -R -i "$srcdir/make_alt_work.patch"
  patch -Np1 -i "$srcdir/mosh_fix.patch"

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vte \
      --localstatedir=/var --disable-static \
      --enable-introspection --with-gtk=2.0
  make
}

package(){
  cd "$srcdir/vte-$pkgver"
  make DESTDIR="$pkgdir" install

  rm "$pkgdir/usr/lib/vte/gnome-pty-helper"
}
