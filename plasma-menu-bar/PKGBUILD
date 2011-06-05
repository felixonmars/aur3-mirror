#CONTRIBUTOR: Zephyr

pkgname=plasma-menu-bar
pkgver=0.1.15
pkgrel=3
pkgdesc="Plasmoid to display menubar of application windows"
url="https://launchpad.net/plasma-widget-menubar"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdebase-workspace>=4.6.0' 'appmenu-qt' 'qjson')
makedepends=('cmake' 'automoc4')
optdepends=('appmenu-gtk: Showing GTK+ Apps menus')
source=("http://launchpad.net/plasma-widget-menubar/trunk/${pkgver}/+download/plasma-widget-menubar-${pkgver}.tar.bz2"
        "https://bugs.launchpad.net/plasma-widget-menubar/+bug/762865/+attachment/2111453/+files/fix_gtk_apps.diff")
sha1sums=('0ffe1c8f50e4e0ac63fb4a76a9674ab21e7f5f03'
          'f874222526e7b00848ad104c41bfa0254ce085cd')

build() {
  cd ${srcdir}/plasma-widget-menubar-${pkgver}

  patch -Np0 -i ${srcdir}/fix_gtk_apps.diff 

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "${srcdir}/plasma-widget-menubar-${pkgver}"
  make DESTDIR=${pkgdir} install
}
# vim:syntax=sh
