pkgname=kdeplasma-applets-kappmenubar
dirname=plasma-widget-kappmenubar
pkgver=0.9.8
pkgrel=1
pkgdesc="A Plasma widget to display menubar of application windows (compatible with kded-appmenu)"
arch=('i686' 'x86_64')
url='https://gitorious.org/plasma-widget-kappmenubar/plasma-widget-kappmenubar'
license=('GPL')
depends=('libkappmenu')
makedepends=('cmake' 'automoc4')
conflicts=('kded-appmenu-git')
source=("http://kde-apps.org/CONTENT/content-files/153884-plasma-widget-kappmenubar-$pkgver.tar.gz")
sha1sums=('d6cfe73a007c4b0999a7a1c9e884bfc007491a2f')

build() {
  cd "${srcdir}/${dirname}-${pkgver}"
  rm -fr build
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "${srcdir}/${dirname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
