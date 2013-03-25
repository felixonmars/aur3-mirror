# Maintainer: Christer Edwards <christer.edwards@gmail.com>
pkgname=salt-api-git
pkgver=20130324
pkgrel=1
pkgdesc="Salt API is used to expose the fundamental aspects of Salt control to external sources."
arch=('any')
url="https://github.com/saltstack/salt-api"
license=('APACHE')
depends=('python2'
	 'salt')

makedepends=('git')
conflicts=('salt-api')
provides=('salt-api')

_gitroot="https://github.com/saltstack/salt-api.git"
_gitname="salt-api"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_gitname}-build
  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

}

package() {
  cd ${srcdir}/${_gitname}-build
  python2 setup.py install --root=${pkgdir}/ --optimize=1

  install -Dm644 ${srcdir}/salt-api/pkg/salt-api.service ${pkgdir}/usr/lib/systemd/system/salt-api.service
}
