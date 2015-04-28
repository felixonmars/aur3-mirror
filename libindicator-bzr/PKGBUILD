# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Xiao-long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

pkgbase=libindicator-bzr
pkgname=(libindicator{,3}-bzr)
pkgver=r531
pkgrel=2
pkgdesc="A set of symbols and convience functions that all indicators would like to use (bzr version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/libindicator"
license=('GPL')
makedepends=(gtk{2,3} 'glib2' 'ido-bzr')
groups=('unity')
source=("bzr+lp:libindicator")
sha512sums=('SKIP')

pkgver() {
  cd libindicator

  printf "r%s" "$(bzr revno)"
}

build() {
  cd "${srcdir}/libindicator"

  export CFLAGS="${CFLAGS} -Wno-error=deprecated-declarations"

  autoreconf -vfi

  [[ -d build-gtk2 ]] || mkdir build-gtk2
  pushd build-gtk2
  ../configure --prefix=/usr --libexecdir=/usr/lib/${pkgbase} --with-gtk=2 --disable-static
  export MAKEFLAGS="-j1"
  make
  popd

  [[ -d build-gtk3 ]] || mkdir build-gtk3
  pushd build-gtk3
  ../configure --prefix=/usr --libexecdir=/usr/lib/${pkgbase} --with-gtk=3 --disable-static
  make
  popd
}

package_libindicator-bzr() {
  pkgdesc+=" (GTK+ 2 library)"
  provides=(libindicator{,-gtk2}{,-bzr}=${pkgver})
  conflicts=(libindicator{,-gtk2})
  depends=('cairo' 'gtk2' 'glib2')

  cd "${srcdir}/libindicator/build-gtk2"

  export MAKEFLAGS="-j1"
  make DESTDIR="${pkgdir}/" install
}

package_libindicator3-bzr() {
  pkgdesc+=" (GTK+ 3 library)"
  provides=(libindicator{3,-gtk3}{,-bzr}=${pkgver})
  conflicts=(libindicator{3,-gtk3})
  depends=('gtk3' 'glib2' 'ido')
  options=(${options[@]} '!emptydirs')

  cd "${srcdir}/libindicator/build-gtk3"

  export MAKEFLAGS="-j1"
  make -C libindicator DESTDIR="${pkgdir}/" install
  make -C tools DESTDIR="${pkgdir}/" install

  # Identical in both packages, but Ubuntu puts it in the GTK 2 package
    # Debug
      rm -vf  "${pkgdir}/usr/share/libindicator/80indicator-debugging"
}
