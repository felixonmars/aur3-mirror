# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=docutils-snapshot
pkgver=20080827
pkgrel=6
pkgdesc="A set of tools for processing plaintext documentation into useful formats, such as HTML, XML, and LaTeX"
url="http://docutils.sourceforge.net"
license=("custom")
depends=('python')
conflicts=('docutils')
provides=('docutils')
source=(http://docutils.sourceforge.net/$pkgname.tgz)
md5sums=()
arch=('i686')

build() {
  cd $startdir/src/docutils
  python setup.py install --root=$startdir/pkg || exit 1
  install -D COPYING.txt $startdir/pkg/usr/share/licenses/docutils-snapshot/COPYING
}
