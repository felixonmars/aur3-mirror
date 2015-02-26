# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

pkgname=indicator-appmenu-bzr
pkgver=r268
pkgrel=1
epoch=1
pkgdesc="An indicator to host the menus from an application"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-appmenu"
license=('GPL')
groups=('unity')
depends=('dconf' 'libappindicator3' 'libindicator3' 'libdbusmenu-gtk3' 'bamf')
makedepends=('gtk-doc' 'intltool' 'vala')
optdepends=('unity-gtk-module: support for GTK+ 2 and GTK+ 3 apps'
            'appmenu-qt: support for Qt apps')
provides=('indicator-appmenu-tools')
conflicts=('indicator-appmenu-tools')
options=('!emptydirs')
install="${pkgname}.install"
source=("bzr+lp:indicator-appmenu"
        '0001_autoconf.patch')
sha512sums=('SKIP'
            '31b83e433824bd7acd7be93bfd60932114eff344fea77c8ea1125272d5881fd61c1609d4fbf24de0cc8838e76d8ac405e7a19162e3ce2021b6b5b6dbb61c31f8')

pkgver() {
  cd indicator-appmenu

  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${srcdir}/indicator-appmenu"

  # Autoconf fix
  patch -p1 -i "${srcdir}/0001_autoconf.patch"
}

build() {
  cd "${srcdir}/indicator-appmenu"

  export CFLAGS="${CFLAGS} -Wno-error"

  gtkdocize
  autoreconf -vfi
  intltoolize -f

  ./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname} --disable-static
  make
}

package() {
  cd "${srcdir}/indicator-appmenu/"

  make DESTDIR="${pkgdir}/" install
}
