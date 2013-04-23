# Maintainer: Kevin Lui kevinywlui gmail
# Submitter: Atterratio
pkgname=pycrypto-git
pkgver=20130216
pkgrel=2
pkgdesc="Collection of cryptographic algorithms and protocols, implemented for use from Python. Compatible with Python3"
arch=(i686 x86_64)
depends=('python')
makedepends=('git')
url="http://www.dlitz.net/software/pycrypto/"
license=(custom)

_gitroot="git://github.com/dlitz/pycrypto.git"
_gitname="${pkgname}"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/"
  cp -r LEGAL "${pkgdir}/usr/share/licenses/${pkgname}/"
}
