# Maintainer: Dominik Pieczyński <dominik.pieczynski@gmail.com>

pkgname=dcs-git
pkgver=r16.a287813
pkgrel=1
pkgdesc='Creator of systemd services for Docker containers'
arch=('any')
url="https://github.com/rivi/dcs"
license=('GPL')
depends=('python-yaml' 'python-dbus' 'python-docker')
makedepends=('git')
source=($pkgname::git+https://github.com/rivi/dcs.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir/" --optimize=1
}
