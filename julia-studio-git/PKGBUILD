# Maintainer:  kjslag <kjslag at gmail dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Alessandro Andrioni <alessandroandrioni@gmail.com>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>

_pkgname=julia-studio
pkgname=julia-studio-git
pkgver=0.4.2.r99.g938fede
pkgrel=1
pkgdesc="An IDE for the Julia Language"
arch=('i686' 'x86_64')
url="https://github.com/forio/julia-studio"
license=('GPL3')
depends=('qt5-declarative' 'qt5-script' 'xdg-utils')
makedepends=('git' 'qt5-webkit')
install=julia-studio.install
conflicts=('julia-studio' 'qtcreator')
provides=('julia-studio')
optdepends=('qt5-webkit: needed by the HTML viewer')
source=('git://github.com/forio/julia-studio.git'
    'qtcreator.desktop'
    'julia-studio-git.desktop')
md5sums=('SKIP'
         '82888d4be900e7833d768050a135cd37'
         '695945432030adddb65d6e01f79b96ae')


pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$_pkgname"
  qmake-qt5 -r
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install INSTALL_ROOT=$pkgdir/usr
  install -Dm644 ${srcdir}/qtcreator.desktop ${pkgdir}/usr/share/applications/qtcreator.desktop
  install -Dm644 ${srcdir}/julia-studio-git.desktop ${pkgdir}/usr/share/applications/julia-studio-git.desktop

  cd "$pkgdir/usr/lib"
  ln -s julia-studio/libExtensionSystem.so* .
}

# vim:set ts=2 sw=2 et:
