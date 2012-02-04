# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>

pkgname=python3-pyinotify
pkgver=0.9.2
pkgrel=1
pkgdesc="Python module used for monitoring filesystems events on Linux platforms with inotify"
arch=('any')
url="http://github.com/seb-m/pyinotify"
license=('MIT')
depends=('python')
source=(http://seb.dbzteam.org/pub/pyinotify/releases/pyinotify-$pkgver.tar.gz)
md5sums=('7d344e1efe3fe342e2e052774c9779e2')

build() {
  cd pyinotify

  python setup.py install --root="$pkgdir" -O1
}
