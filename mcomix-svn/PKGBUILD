# Maintainer: marcinfa <marcinfa@gmail.com>

pkgname=mcomix-svn
pkgver=887
pkgrel=1
pkgdesc="A comic book viewer"
arch=('i686' 'x86_64')
url="http://mcomix.sourceforge.net"
license=('GPL')
provides=('mcomix')
conflicts=('mcomix')
depends=('pygtk' 'python-imaging' 'xdg-utils' 'python2' \
         'desktop-file-utils' 'hicolor-icon-theme' 'python2-distribute')
makedepends=('gettext' 'intltool')
optdepends=('unrar: for rar compressed comics')
source=("mcomix-code::svn+http://svn.code.sf.net/p/mcomix/code/")
md5sums=('SKIP')
install=mcomix.install
_svnmod=mcomix-code

pkgver() {
  cd "${SRCDEST:-$srcdir}/mcomix-code"
  svnversion
}

build() {
  cd "${srcdir}/${_svnmod}"

    # python2 fix
  for file in $(grep -Rl "/usr/bin/env python" .);
  do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done
}

package() {
    cd "${srcdir}/${_svnmod}"
    mkdir -p ${pkgdir}/usr
    export PYTHONPATH=${pkgdir}/usr/lib/python2.7/site-packages/
    mkdir -p $PYTHONPATH
    python2 setup.py install --prefix=${pkgdir}/usr --optimize=1 \
    --single-version-externally-managed --root=/
    install -Dm644 mime/comicbook.schemas \
    ${pkgdir}/usr/share/gconf/schemas/mcomix.schemas
}
