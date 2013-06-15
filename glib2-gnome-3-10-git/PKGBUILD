# Maintainer: Yosef Or Boczko <yosefor3@walla.com>

_pkgname=glib2-gnome-3-10
pkgname=$_pkgname-git
_realver=2.37.2
pkgver=2.37.1.91.g910732e
pkgrel=1
pkgdesc="Common C routines used by GTK+ and other libs"
url="http://www.gtk.org/"
license=('LGPL')
arch=('i686' 'x86_64')
options=('!docs' '!libtool' '!emptydirs')
depends=('pcre' 'libffi')
makedepends=('git' 'pkg-config' 'python2' 'libxslt' 'docbook-xml' 'pcre' 'libffi' 'elfutils')
optdepends=('python2: for gdbus-codegen and gtester-report'
        'elfutils: gresource inspection tool')
conflicts=('glib2' 'glib2-docs')
replaces=('glib2' 'glib2-docs')
provides=('glib2' "glib2=$_realver" "$_pkgname=$_realver")
source=('git://git.gnome.org/glib'
        'revert-warn-glib-compile-schemas.patch')
sha256sums=('SKIP'
            '049240975cd2f1c88fbe7deb28af14d4ec7d2640495f7ca8980d873bb710cc97')

pkgver() {
  cd "$srcdir/glib"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/glib"
  patch -Rp1 -i ../revert-warn-glib-compile-schemas.patch
}

build() {
  cd "$srcdir/glib"

  PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr --libdir=/usr/lib \
      --sysconfdir=/etc \
      --with-pcre=system \
      --disable-fam \
      --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/glib"
  make completiondir=/usr/share/bash-completion/completions DESTDIR="$pkgdir" install

  for _i in "$pkgdir/usr/share/bash-completion/completions/"*; do
      chmod -x "$_i"
  done
  
  cd docs
  install -m755 -d "${pkgdir}/usr/share/licenses/glib2-docs"
  install -m644 reference/COPYING "${pkgdir}/usr/share/licenses/glib2-docs/"
}
