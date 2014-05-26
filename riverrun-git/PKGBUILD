# Maintainer: Arthur Darcet <arthur.darcet@m4x.org>

pkgname=riverrun-git
_gitname=riverrun
pkgver=0.1
pkgrel=1
pkgdesc="A minimalist book library web interface."
arch=('any')
url="https://github.com/arthurdarcet/riverrun"
license=('MIT')
depends=(
	'python'
	'python-cherrypy'
	'python-epub'
	'python-pymongo'
	'python-requests'
	'python-sh'
	'python-yaml'
)
optdepends=(
	'mongodb: A mongo DB is needed somewhere'
	'calibre: To convert books on the fly'
)
makedepends=('git')
backup=('etc/riverrun.conf')
conflicts=('riverrun')
provides=('riverrun')
source=("git+${url}" 'riverrun.service')
sha1sums=('SKIP' '5158bdefcacdee59cc4c7fb84cce7ce152fcc59c')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
  install -Dm640 riverrun/config.yaml "${pkgdir}/etc/riverrun.conf"
  install -Dm644 ../riverrun.service "${pkgdir}/usr/lib/systemd/system/riverrun.service"
}
