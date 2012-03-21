# Maintainer: Eric Koenigs <e.koenigs@stud.uni-heidelberg.de>

pkgname=charon-templategenerator
pkgver=0.1.4
pkgrel=2
pkgdesc="Part of the Charon-Suite. Software assistant to set up module code templates."
arch=('any')
url="https://sourceforge.net/apps/trac/charon-suite"
license=('LGPL3')
groups=("charon-suite")
makedepends=('bzr' 'cmake')
depends=('qt')
optdepends=('doxygen: documentation generation'
'texlive-latexextra: pdf-documentation and formulas'
)

build() {
  msg "Fetching bzr sources from Launchpad..."

  bzr branch lp:charon-templates

  msg "Configuring build..."

  mkdir -p $startdir/build
  cd $startdir/build

  cmake $startdir/src/charon-templates \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Dtemplategenerator_INSTALL_DOC=/usr/share/doc/$pgkname

  make
  
  if [ "$(pacman -Qq | grep '^doxygen$' )" ]
  then
    msg "Doxygen installed, creating documentation..."
    make doc
  fi
}

package() {
  cd $startdir/build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
