pkgname=kdeplasma-applets-menubar-archway-bzr
pkgver=0.2.0
pkgrel=123
pkgdesc="A Plasma widget to display menubar of application windows"
arch=('i686' 'x86_64')
url='https://launchpad.net/plasma-widget-menubar'
license=('GPL')
depends=('kdelibs' 'qjson')
makedepends=('cmake' 'automoc4' 'bzr')
conflicts=('plasma-widget-menubar' 'kdeplasma-applets-menubar')
replaces=('plasma-widget-menubar')
optdepends=('gtk2-appmenu: support for GTK+ 2 apps'
            'gtk3-appmenu: support for GTK+ 3 apps'
            'appmenu-qt: support for Qt apps'
            'libreoffice-extension-menubar: support for LibreOffice')
source=("$pkgname"::'bzr+lp:~kol-93/plasma-widget-menubar/plasma-widget-menubar')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "$pkgver.r%s" "$(bzr revno)"
}

build() {
  [ -f build ] && rm build
  [ -d build ] || mkdir build
  cd build
  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
