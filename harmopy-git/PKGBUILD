# Maintainer: Arthur Darcet <arthur.darcet@m4x.org>

pkgname=harmopy-git
_gitname=harmopy
pkgver=d0a9f4b
pkgrel=1
pkgdesc="A file synchronisation deamon controlled by a web interface."
arch=('any')
url="https://github.com/arthurdarcet/harmopy"
license=('MIT')
depends=('python' 'python-sh' 'python-cherrypy')
makedepends=('git')
backup=('etc/harmopy.conf')
conflicts=('harmopy')
provides=('harmopy')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
  install -Dm640 harmopy.conf "${pkgdir}/etc/harmopy.conf"
  install -Dm644 harmopy.service "${pkgdir}/usr/lib/systemd/system/harmopy.service"
}
