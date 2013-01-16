# Maintainer: marcinfa <marcinfa@gmail.com>

pkgname=comix-svn
pkgver=325
pkgrel=1
pkgdesc="A comic book viewer"
arch=('i686' 'x86_64')
url="http://comix.sourceforge.net"
license=('GPL')
provides=('comix')
conflicts=('comix')
depends=('pygtk' 'python2-imaging' 'unrar' 'xdg-utils')
makedepends=('gettext' 'intltool')
install=comix.install
_svntrunk=https://comix.svn.sourceforge.net/svnroot/comix/trunk
_svnmod=comix

build() {
  cd "${srcdir}"
  msg "Connecting to SVN server...."
  if [[ -d "${_svnmod}/.svn" ]]; then
    (cd "${_svnmod}" && svn up -r "${pkgver}")
  else
    svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi
  rm -rf "${srcdir}/${_svnmod}-build"
  msg "SVN checkout done or server timeout"
  svn export --quiet "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

    # python2 fix
    for file in src/comix.py mime/comicthumb; do
        sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
    done
}

package() {
    cd "${_svnmod}-build"
    mkdir -p ${pkgdir}/usr
    python2 install.py install --no-mime --dir ${pkgdir}/usr
    install -D -m644 mime/comicbook.schemas \
        ${pkgdir}/usr/share/gconf/schemas/comix.schemas
    install -D mime/comicthumb ${pkgdir}/usr/bin/comicthumb
    install -D -m644 mime/comicthumb.1.gz \
        ${pkgdir}/usr/share/man/man1/comicthumb.1.gz
}
