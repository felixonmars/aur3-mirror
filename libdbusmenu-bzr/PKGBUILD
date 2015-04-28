# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Xiao-Long Chen
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

pkgbase=libdbusmenu-bzr
pkgname=(libdbusmenu-{glib,gtk{2,3}}-bzr)
# Ubuntu: please stop changing your versioning scheme
pkgver=r477
pkgrel=1
pkgdesc="A small little library that was created by pulling out some comon code out of indicator-applet"
arch=('i686' 'x86_64')
url="https://launchpad.net/dbusmenu"
license=('LGPL')
makedepends=('json-glib' 'gtk2' 'gtk3' 'intltool' 'gtk-doc' 'gobject-introspection' 'vala' 'python2' 'valgrind')
groups=('unity')
source=("bzr+lp:libdbusmenu"
        '0001_autoconf.patch')
sha512sums=('SKIP'
            '233865822a6280dbd536db131511648bdf40af042ae8afa1ed813cd2538c4e9f5f1ada8868de27bf60f1bed8830ace9916c097ba3d8d698744a2fac95a6dbabf')

pkgver() {
  cd libdbusmenu

  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${srcdir}/libdbusmenu"

  patch -p1 -i "${srcdir}/0001_autoconf.patch"
}

build() {
  cd "${srcdir}/libdbusmenu"

  gtkdocize
  autoreconf -vfi
  intltoolize -f

  # Python2 fix
  sed -i "s|^\(#!.*python\)$|\12|" tools/dbusmenu-bench

  #" # Stupid vim highlighting

  # libdbusmenu-gtk2 won't install if libdbusmenu-glib is missing
  sed -i 's|$(DBUSMENUGTK_CFLAGS)|$(DBUSMENUGTK_CFLAGS) -L../libdbusmenu-glib/.libs|' libdbusmenu-gtk/Makefile.{am,in}

  [[ -d build-gtk2 ]] || mkdir build-gtk2
  pushd build-gtk2
  ../configure --prefix=/usr --libexecdir=/usr/lib/libdbusmenu --disable-scrollkeeper --with-gtk=2 --disable-static
  make -j1
  popd

  [[ -d build-gtk3 ]] || mkdir build-gtk3
  pushd build-gtk3
  ../configure --prefix=/usr --libexecdir=/usr/lib/libdbusmenu --disable-scrollkeeper --with-gtk=3 --disable-static
  make
  popd
}

# I've modified thn81's PKGBUILD so that the directory structure of the packages
#   are identical to Ubuntu's. It should have better compatibility will other
#   packages that depend on libdbusmenu.

package_libdbusmenu-glib-bzr() {
  depends=('json-glib')
  provides=(libdbusmenu-glib{,-bzr}=${pkgver})
  conflicts=('libdbusmenu-glib')

  cd "${srcdir}/libdbusmenu/build-gtk3"

  export MAKEFLAGS="-j1"
  make -C libdbusmenu-glib DESTDIR="${pkgdir}/" install
  make -C tools DESTDIR="${pkgdir}/" install
  make -C tests DESTDIR="${pkgdir}/" install
  make -C docs/libdbusmenu-glib DESTDIR="${pkgdir}/" install
  make -C po DESTDIR="${pkgdir}/" install
}

package_libdbusmenu-gtk2-bzr() {
  pkgdesc+=" (GTK+ 2 library)"
  depends=('gtk2' "libdbusmenu-glib=${pkgver}")
  provides=(libdbusmenu{,-gtk2}{,-bzr}=${pkgver})
  conflicts=(libdbusmenu{,-gtk2})
  cd "${srcdir}/libdbusmenu/build-gtk2"

  export MAKEFLAGS="-j1"
  make -C libdbusmenu-gtk DESTDIR="${pkgdir}/" install
  make -C docs/libdbusmenu-gtk DESTDIR="${pkgdir}/" install
}

package_libdbusmenu-gtk3-bzr(){
  pkgdesc+=" (GTK+ 3 library)"
  depends=('gtk3' "libdbusmenu-glib=${pkgver}")
  provides=(libdbusmenu-gtk3{,-bzr}=${pkgver})
  conflicts=(libdbusmenu{,-gtk3,3)
  cd "${srcdir}/libdbusmenu/build-gtk3"

  export MAKEFLAGS="-j1"
  make -C libdbusmenu-gtk DESTDIR="${pkgdir}/" install
}
