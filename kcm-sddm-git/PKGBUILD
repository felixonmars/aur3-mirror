pkgname=kcm-sddm-git
pkgver=r50.fe615f2
pkgrel=1
pkgdesc="SDDM configuration module for KDE"
arch=('i686' 'x86_64')
url="https://github.com/sddm/sddm-kcm"
license=("GPL")
depends=('sddm' 'kdelibs')
makedepends=('git' 'cmake' 'automoc4')
provides=('kcm-sddm')
replaces=('kcm-sddm')
source=(git://github.com/sddm/sddm-kcm.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/sddm-kcm"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/sddm-kcm"

  cmake . -DCMAKE_INSTALL_PREFIX="`kde4-config --prefix`" -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

package() {
  cd "${srcdir}/sddm-kcm"

  make DESTDIR="${pkgdir}" install
}

