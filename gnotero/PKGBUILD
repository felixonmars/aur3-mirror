# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=gnotero
pkgver=0.43
pkgrel=1
pkgdesc="A Gtk application which provides access to your Zotero references"
arch=(any)
url="http://www.cogsci.nl/software/gnotero"
license=('GPL')
depends=('python2' 'pygtk' 'pdftk' 'desktop-file-utils')
optdepends=(
  'gnote: for integration with gnote'
  'python-levenshtein: for integration with gnote'
)
source=(http://www.cogsci.nl/files/software/${pkgname}/${pkgname}_${pkgver}-1.tar.gz)
md5sums=('579b4568f7e0820cce3aee3d10e0b54c')
sha1sums=('26335bb37e2485df64ae1da5d3204906ff1e771c')
install=gnotero.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir

  # Patch to use python2
  find $pkgdir -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    \{\} +
}
