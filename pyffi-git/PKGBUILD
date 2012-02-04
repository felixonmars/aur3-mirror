# Maintainer: Mike Shutlar (iFSS) <mike at epinux(dot)co(dot)uk>
# Python File Format Interface (PyFFI)
pkgname=pyffi-git
pkgver=20111016
pkgrel=1
pkgdesc="Library and editor (QSkope) for block structured binaries (nif,kfm,cgf,egm,dds,tga)"
arch=('any')
url="http://pyffi.sourceforge.net/"
license=('custom:BSD')
groups=('niftools-git')
depends=('pyqt' 'wine<=1.3.28')
provides=('pyffi')
conflicts=('pyffi')

_gitroot="git://github.com/amorilia/pyffi.git"
_gitname="pyffi"

build() {
  cd "${srcdir}"

  msg "Connecting to the GIT repository..."
  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull origin
  else
    git clone --depth=1 --recursive ${_gitroot}
  fi
  msg "GIT checkout done (who invented that stupid 'server timeout' message? :)"
}


package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  chmod +x "${pkgdir}/usr/lib/python3.2/site-packages/pyffi/utils/mopper.exe"
  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE.rst"
}