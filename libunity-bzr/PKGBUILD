# Maintainer: quequotion <quequotion@bugmenot.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

pkgname=libunity-bzr
pkgver=r314
pkgrel=2
pkgdesc="A library for instrumenting and integrating with all aspects of the Unity shell"
arch=('i686' 'x86_64')
url="https://launchpad.net/libunity"
license=('LGPL')
depends=('dee-ubuntu' 'libdbusmenu-glib' 'gtk3')
makedepends=('intltool' 'vala' 'python2' 'gobject-introspection')
provides=("libunity=${pkgver}")
conflicts=('libunity')
install=${pkgname}.install
groups=('unity')
source=("bzr+lp:libunity"
        '0001_autoconf.patch'
        '0002_privacy_by_default.patch')
sha512sums=('SKIP'
            '1570c01f4c8ac53bc7806fad78691844a12625b7142270b5a215d203618acc76ba258c4aa969a120186ba9224b726f20a2a9efad05940ffdaa258be49844fa4b'
            '83769f9f54abb8090d5307affba8f974a23ee11dac74d9c3da389b48c9bd80fac241731017c9dcb05af14d4c644228d67af558e97972fceb144a8fc0deed30f7')

pkgver() {
  cd libunity

  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${srcdir}/libunity"

  find -type f -name '*.py' -exec sed -i 's|^\(#!.*python$\)|\12|g' {} \+

  patch -p1 -i "${srcdir}/0001_autoconf.patch"
  patch -p1 -i "${srcdir}/0002_privacy_by_default.patch"

  # Apply Ubuntu patches
#  patch -p1 -i "${srcdir}/${pkgname}_${_actual_ver}${_extra_ver}-${_ubuntu_rel}.diff"

#  for i in $(grep -v '#' 'debian/patches/series'); do
#    msg "Applying ${i} ..."
#    patch -p1 -i "debian/patches/${i}"
#  done
}

build() {
  cd "${srcdir}/libunity"

  intltoolize -f
  autoreconf -vfi
  ./configure --prefix=/usr --disable-static --enable-headless-tests PYTHON=python2
  make -j1
}

package() {
  cd "${srcdir}/libunity"

  make DESTDIR="${pkgdir}/" install
}

