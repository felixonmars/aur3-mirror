pkgname=qt-embedded
pkgver=4.7.4
pkgrel=2
pkgdesc="Qt compiled as embedded variant. This variant of Qt uses the framebuffer"
arch=('x86_64')
url='http://qt.nokia.com/'
license=('GPL3', 'LGPL')
provides=('qt=4.7.4')

_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("ftp://ftp.qt.nokia.com/qt/source/${_pkgfqn}.tar.gz")

sha256sums=("97195ebce8a46f9929fb971d9ae58326d011c4d54425389e6e936514f540221e")

build() 
{
   cd $srcdir/$_pkgfqn

   ./configure -confirm-license -opensource \
      -prefix /usr \
      -embedded \
      -no-qt3support \
      -xmlpatterns \
      -exceptions \
      -largefile \
      -no-phonon \
      -no-phonon-backend \
      -optimized-qmake \
      -make libs \
      -nomake examples \
      -nomake docs \
      -nomake demos

   make -j 2
      
}

package()
{
   cd $srcdir/$_pkgfqn

   make INSTALL_ROOT=$pkgdir install
}

