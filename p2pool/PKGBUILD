# Maintainer: Jason Kölker <jason@koelker.net>
pkgname=p2pool
pkgver=20130832
pkgrel=1
pkgdesc="Peer-to-peer Bitcoin mining pool"
arch=(any)
url="https://github.com/forrestv/p2pool"
license=('GPL3')
depends=('python2' 'twisted' 'nattraverso')
makedepends=('git' 'python2-setuptools')
backup=()
install='p2pool.install'
source=('p2pool.service' 'p2pool.conf' 'setup.py' 'web-static.patch')
md5sums=('bed4a82fe38fce7b84a7daabe5b033e5'
         '33b41b9ae5751395d968be082196ad00'
         '089ab8432d4f3d40d8f29821aa2fc345'
         'e537b1c86d06a80c80cb8dfdf4da75ca')

_gitroot=git://github.com/forrestv/p2pool.git
_gitname=p2pool

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"

  msg "Patching web-static path"
  cd ${_gitname}
  git apply ${srcdir}/web-static.patch

  msg "Fixing setup.py"
  cp ${srcdir}/setup.py ${srcdir}/${_gitname}

  msg "Starting build..."
}

package() {
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
  mkdir -p ${pkgdir}/usr/share/p2pool
  cp -a web-static ${pkgdir}/usr/share/p2pool

  install -D -m644 ${srcdir}/p2pool.conf ${pkgdir}/etc/conf.d/p2pool 
  install -D -m644 ${srcdir}/p2pool.service ${pkgdir}/usr/lib/systemd/system/p2pool.service
}

# vim:set ts=2 sw=2 et:
