pkgname=stressitout-git
_gitname="stressitout-dev"
pkgver=03f8606
pkgrel=1
pkgdesc="StressItOut (or SIO, for short) is a free (as in freedom) hardware stressing and testing program for GNU/Linux writen on Qt"
arch=('i686' 'x86_64')
url='http://qt-apps.org/content/show.php/StressItOut?content=136985'
license=('GPL2')
depends=('qt4' 'mesa' 'lm_sensors')
makedepends=('git')
source=('git://gitorious.org/stressitout/stressitout-dev.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always
}

build() {
  cd "$srcdir/$_gitname"
  if [[ -d build ]]; then
      rm -rf build
  fi
  mkdir build && cd build
  qmake ..
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 build/stressitout "${pkgdir}/usr/bin/stressitout"
  install -Dm644 stressitout.desktop "${pkgdir}/usr/share/applications/stressitout.desktop"
  install -Dm644 icon/64x64/stressitout.png "${pkgdir}/usr/share/pixmaps/stressitout.png"
}