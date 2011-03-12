# Contributor: Charles Clement <caratorn@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Maintainer: Laszlo Papp <djszapi2@gmail.com>
pkgname=bitbake
pkgver=1.12.0
pkgrel=1
pkgdesc="A simple tool for task execution derived from Gentoo's portage"
arch=('any')
url="http://developer.berlios.de/projects/bitbake/"
license=('GPL' 'custom:MIT')

# "Python(2)-progressbar" is only required for the "knotty" UI, but is a
# mandatory dependency here because that is the default UI
depends=(python2 python2-ply python-progressbar)

makedepends=(python2 python2-ply)
source=(http://download.berlios.de/bitbake/${pkgname}-${pkgver}.tar.gz)
md5sums=('53860ba2e38bb9e70ca7189c642605be')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  # Build must be done separately to install because setup.py calls glob
  # ("doc/manual/html/*") which is only populated after the build.
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  # Skip build because we just did it and XMLLINT, XSLTPROC steps take ages
  python2 setup.py install --root=${pkgdir} --optimize=1 --skip-build
  
  local SHARE="${pkgdir}/usr/share"
  
  # Install vim extensions
  local VIMRUNTIME="${SHARE}/vim/vimfiles"
  install -D -m644 contrib/vim/ftdetect/bitbake.vim \
    "${VIMRUNTIME}/ftdetect/bitbake.vim"
  install -D -m644 contrib/vim/syntax/bitbake.vim \
    "${VIMRUNTIME}/syntax/bitbake.vim"
  
  install -D -m644 contrib/bbdev.sh "${SHARE}/bitbake/bbdev.sh"
  install -D -m644 "doc/${pkgname}.1" "${SHARE}/man/man1/${pkgname}.1"

  # Handle MIT license
  install -D -m644 doc/COPYING.MIT "${SHARE}/licenses/${pkgname}/COPYING"
}
