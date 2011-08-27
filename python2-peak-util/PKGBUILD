# Maintainer: Jon Nordby <jononor@gmail.com>

# This package uses Debian source package "python-peak.util"
# http://packages.debian.org/search?keywords=python-peak.util

pkgname=python2-peak-util
_pkgname=python-peak.util
pkgver=20090610
pkgrel=1
pkgdesc="The 'Python Enterprise Application Kit'"
arch=('x86_64' 'i686')
url="http://peak.telecommunity.com/"
license=('PSF' 'ZPL')
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
_sourceroot=http://archive.ubuntu.com/ubuntu/pool/universe
source=($_sourceroot/p/python-peak.util/python-peak.util_20090610.orig.tar.gz)
md5sums=('0108f67ca5a3aa6b8cc6b1b44801a6c9')

_subdirs="peak.util-addons
  peak.util-bytecodeassembler
  peak.util-extremes
  peak.util-symboltype"

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  for dir in $_subdirs
  do
    cd $dir
    python2 setup.py install --root=$pkgdir/ --optimize=1
    cd -
  done

}

# vim:set ts=2 sw=2 et:
