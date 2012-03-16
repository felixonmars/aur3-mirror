# Maintainer: Eric Koenigs <e.koenigs@stud.uni-heidelberg.de>

pkgname=charon
pkgver=0.1.6
pkgrel=1
pkgdesc="Part of the Charon-Suite. Optical flow estimation modules."
arch=('any')
url="https://sourceforge.net/apps/trac/charon-suite"
license=('LGPL3')
groups=("charon-suite")
depends=('charon-core' 'charon-utils')
makedepends=('bzr' 'cmake')
optdepends=('doxygen: documentation generation'
'texlive-latexextra: pdf-documentation and formulas'
)

build() {
  msg "Fetching bzr sources from Launchpad..."

  bzr branch lp:charon-flow

  msg "Configuring build..."

  mkdir -p $startdir/build
  cd $startdir/build

  cmake $srcdir/charon-flow \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Dcharon-core_HTMLDOC_DIR=/usr/doc/charon-core/html \
    -Dcharon-utils_HTMLDOC_DIR=/usr/doc/charon-utils/html 

  make

  if [ $(pacman -Qq doxygen) = "doxygen" ]
  then
    msg "Doxygen installed, creating documentation..."
    make doc
  fi

  # Fix references to $srcdir
  sed -i "s#${srcdir}/${pkgname}#/usr#" doc/*.tag
}

package() {
  cd $startdir/build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
