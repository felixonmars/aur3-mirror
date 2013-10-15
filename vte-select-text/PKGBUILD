# Maintainer: Xu Fasheng <fasheng.xu@gmail.com>
# Last Maintainer: Jakub Klinkovský <kuba.klinkovsky@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=vte-select-text
_pkgname=vte
pkgver=0.28.2
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK2 - patched to expose vte_terminal_select_text function"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!libtool' '!emptydirs')
depends=('gtk2')
makedepends=('pygtk' 'intltool' 'gobject-introspection' 'pygobject2-devel')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/GNOME/sources/vte/0.28/vte-$pkgver.tar.xz
        make_alt_work.patch::http://git.gnome.org/browse/vte/patch/?id=b73782a28894e25ed146271f9d6c6775a6836199
        https://raw.github.com/thestinger/termite/master/expose_select_text.patch
        expose_select_text_pygtk.patch::https://raw.github.com/fasheng/patch/master/vte_0.28.2_expose_select_text_pygtk.patch)
md5sums=('497f26e457308649e6ece32b3bb142ff'
         'c8f136fb640b0af8626afc95091feef5'
         'a81adf559428a6f4e4395f3e0430b69d'
         '1da605c5be47f8b8dbae5c146b7e3f65')
provides=('vte')
conflicts=('vte')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  #warning: type-punning to incomplete type might break strict-aliasing rules
  export CFLAGS="$CFLAGS -fno-strict-aliasing"

  patch -Np1 -R -i "$srcdir/make_alt_work.patch"
  patch -Np1 -i "$srcdir/expose_select_text.patch"
  patch -Np1 -i "$srcdir/expose_select_text_pygtk.patch"

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vte \
      --localstatedir=/var --disable-static \
      --enable-introspection --with-gtk=2.0
#      --disable-gnome-pty-helper
  make
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/lib/vte/gnome-pty-helper"
}
