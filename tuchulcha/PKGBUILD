# Maintainer: Eric Koenigs <e.koenigs@stud.uni-heidelberg.de>

pkgname=tuchulcha
pkgver=0.1.6
pkgrel=2
pkgdesc="Graphical configuration/workflow editor for algorithm prototyping. Part of the Charon-Suite."
arch=('any')
url="https://sourceforge.net/apps/trac/charon-suite"
license=('LGPL3')
groups=("charon-suite")
makedepends=('bzr' 'cmake')
depends=('charon-core' 'qt')
optdepends=('charon-utils: Basic Image manipulation and processing modules'
'charon: Optical flow estimation modules'
'doxygen: documentation generation'
'texlive-latexextra: pdf-documentation and formulas'
)

build() {
  msg "Fetching bzr sources from Launchpad..."

  bzr branch lp:tuchulcha

  msg "Configuring build..."

  mkdir -p $startdir/build
  cd $startdir/build

  cmake $startdir/src/tuchulcha \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Dcharon-core_HTMLDOC_DIR=/usr/share/doc/charon-core/html \
    -Dtuchulcha_INSTALL_DOC=/usr/share/doc/$pkgname

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
