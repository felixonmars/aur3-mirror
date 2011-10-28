# Maintainer: Gordin <9ordin @t gmail dot com>

pkgname='python2-gntp-git'
pkgver=20111028
pkgrel=1
pkgdesc='Python bindings for the Growl Notification Transport Protocol'
arch=('any')
url='http://kungfudiscomonkey.net/gntp/'
license=('MIT')
depends=('python2')
provides=('python2-gntp')
makedepends=('git')

_gitroot="https://github.com/kfdm/gntp.git"
_gitname="gntp"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname} --depth=1
  fi

  msg "GIT checkout done or server timeout"
}

package() {
    cd ${srcdir}/${_gitname}
    python2 setup.py install --root=${pkgdir}
    install -D -m644 "${srcdir}/gntp/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

