# Maintainer: agapito <agapitofrndez@ozu.es>

pkgname=chakra-gtk-config
pkgver=1.7
pkgrel=1
pkgdesc="Chakra Gtk Config it is a KCM for set the look&feel of your Gtk apps using the KDE systemsettings. written from scratch in Qt, you can set the widget, the icon themes and the font family."
arch=("i686" "x86_64")
license=('GPL')
url="http://chakra-project.org"
depends=('qt' 'kdebase-runtime' 'kdelibs')
makedepends=('automoc4' 'cmake')
source=("http://sourceforge.net/projects/chakra/files/Tools/Chakra-Gtk-Config/chakra-gtk-config-$pkgver.tar.gz")
md5sums=('d7e9c6ba2a9dc06252589f3d86b44489')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. \
    -DCMAKE_BUILD_TYPE=Release
  make
  make DESTDIR="${pkgdir}" install
}


