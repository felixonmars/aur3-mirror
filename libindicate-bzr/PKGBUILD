# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

pkgbase=libindicate-bzr
pkgname=(libindicate{,-gtk{2,3}}-bzr)
pkgver=r462
pkgrel=2
pkgdesc="A small library for applications to raise 'flags' on DBus for other components of the desktop to pick up and visualize"
arch=('i686' 'x86_64')
url="https://launchpad.net/libindicate"
license=('LGPL')
makedepends=('libdbusmenu-glib' 'dbus-glib' 'gtk2' 'gtk3' 'gobject-introspection' 'vala' 'gtk-sharp-2' 'pygtk' 'gnome-doc-utils' 'perl-xml-libxml')
groups=('unity')
source=("bzr+lp:libindicate"
        '0001_autoconf.patch')
sha512sums=('SKIP'
            '83a860e35dfaf968a602a4240aaecf92a967bcbfe40fbbbae7f29679ffea9b928307c75e7569cecaf9b8e3134af231fc6e1adb32700b7eeba9d2e21c10d7b09d')

pkgver() {
  cd libindicate

  printf "r%s" "$(bzr revno)"
}


prepare() {
  cd "libindicate"

  patch -p1 -i "${srcdir}/0001_autoconf.patch"
}

build() {
  cd "${srcdir}/libindicate"

  export CFLAGS="${CFLAGS} -Wno-error=deprecated-declarations"

  # Python 2 fix
  sed -i "s|^\(#!.*python\)$|\12|" examples/{im-client,listen-and-print}.py
  sed -i 's/-lpyglib-2\.0-python$PYTHON_VERSION/-lpyglib-2.0-python2/' configure.ac

  # libindicate-gtk2 won't install if libindicate isn't installed yet
  sed -i 's|$(LIBINDICATEGTK_CFLAGS)|$(LIBINDICATEGTK_CFLAGS) -L../libindicate/.libs|' libindicate-gtk/Makefile.am

  autoreconf -vfi

  export MAKEFLAGS="-j1"
  [[ -d build-gtk2 ]] || mkdir build-gtk2
  pushd build-gtk2
  ../configure --prefix=/usr --libexecdir=/usr/lib/libindicate --with-gtk=2 --disable-static PYTHON=python2
  make
  popd

  [[ -d build-gtk3 ]] || mkdir build-gtk3
  pushd build-gtk3
  ../configure --prefix=/usr --libexecdir=/usr/lib/libindicate3 --with-gtk=3 --disable-static PYTHON=python2
  make
  popd
}

package_libindicate-bzr() {
  depends=('libdbusmenu-glib' 'dbus-glib')
  provides=(libindicate{,-bzr}=${pkgver})
  conflicts=('libindicate')
  cd "${srcdir}/libindicate/build-gtk2"

  export MAKEFLAGS="-j1"

  make -C libindicate DESTDIR="${pkgdir}" install
  make -C bindings/mono/indicate DESTDIR="${pkgdir}" install
  make -C tests DESTDIR="${pkgdir}" install
  make -C docs DESTDIR="${pkgdir}" install
}

package_libindicate-gtk2-bzr() {
  pkgdesc+=" (GTK+ 2 library)"
  depends=('cairo' "libindicate=${pkgver}" 'gtk2' 'python2-gobject2')
  provides=(libindicate-gtk2{,-bzr}=${pkgver})
  conflicts=('libindicate-gtk2')

  cd "${srcdir}/libindicate/build-gtk2"

  export MAKEFLAGS="-j1"

  make -C libindicate-gtk DESTDIR="${pkgdir}" install
  make -C bindings/python DESTDIR="${pkgdir}" install
  make -C bindings/mono/indicate-gtk DESTDIR="${pkgdir}" install
  make -C examples DESTDIR="${pkgdir}" install
}

package_libindicate-gtk3-bzr(){
  pkgdesc+=" (GTK+ 3 library)"
  depends=('cairo' "libindicate=${pkgver}" 'gtk3')
  provides=(libindicate{3,-gtk3}{,-bzr}=${pkgver})
  conflicts=(libindicate{3,-gtk3})

  cd "${srcdir}/libindicate/build-gtk3"

  export MAKEFLAGS="-j1"

  make -C libindicate-gtk DESTDIR="${pkgdir}" install
}

