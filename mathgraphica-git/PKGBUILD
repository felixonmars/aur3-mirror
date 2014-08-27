# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=mathgraphica-git
pkgver=56.7351c5e
pkgrel=1
pkgdesc="Advanced scientific calculator with 2D/3D/4D OpenGL graphs."
url="http://soft-ingenium.planetaclix.pt/MathGraphicaMain.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
source=('git+https://gitorious.org/math-graphica/mathgraphica.git'
         MathGraphica
         mathgraphica.desktop)
md5sums=('SKIP'
         'fceb0fec0c132f7837c9995db14c525a'
         '45dac02b92e1a6a3cf89352f1bb7fa9a')

prepare() {
  cd $srcdir/mathgraphica
  qmake-qt5
}

build() {
  cd $srcdir/mathgraphica
  make
}

package() {
  # Launcher
  install -Dm755 MathGraphica $pkgdir/usr/bin/mathgraphica
  
# Binary
  cd $srcdir/mathgraphica
  install -Dm755 MathGraphica $pkgdir/usr/share/MathGraphica/MathGraphica
 
  # Manual
  mkdir -p $pkgdir/usr/share/MathGraphica/math_html
  cp math_html/* $pkgdir/usr/share/MathGraphica/math_html
  
  # Desktop icon
  install -Dm644 ../mathgraphica.desktop $pkgdir/usr/share/applications/mathgraphica.desktop
  install -Dm644 images/calculator.png $pkgdir/usr/share/pixmaps/mathgraphica.png
}

pkgver() {
  cd $srcdir/mathgraphica
  echo $(git rev-list --count master).$(git rev-parse --short master)
}