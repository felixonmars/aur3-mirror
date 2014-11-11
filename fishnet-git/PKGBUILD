# Maintainer: Dudytz  <dudytz [at] gmail (dot) com>

pkgname=fishnet-git
pkgver=0.9.BETA.2.g23f076a
pkgrel=1
pkgdesc="F1S#N3T (or Fishnet) is a simple utility to find torrents. It aggregates results from different providers, which can be loaded remotely or locally, and displays them."
arch=('i686' 'x86_64')
url="https://github.com/cr0wbar/fishnet"
license=("GPLv3")
makedepends=('git' 'python2-distribute')
depends=('python-pyqt5' 'python-lxml' 'python-urllib3')
_gitname=('fishnet')
source=("$_gitname"::'git://github.com/cr0wbar/fishnet.git')

pkgver() {
	cd ${_gitname}
	git describe --tags | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
	true
}
md5sums=('SKIP')
