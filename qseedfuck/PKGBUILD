# Maintainer: Brieuc Roblin <brieuc.roblin at gmail dot com>
pkgname=qseedfuck
pkgver=0.3
pkgrel=3
pkgdesc="Fast bittorrent announcer with fake IPs"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt')
url='http://www.pyrotools.org/software/qseedfuck'
source=('http://www.pyrotools.org/software/qseedfuck/qseedfuck-0.3.src.tar.gz')
md5sums=('636875692381dfdef2d5d0bb7ef431a0')

build() {
  cd "$srcdir"

  # Compiling
  msg2 "Starting make..."
  qmake
  make
}

package() {
  cd "$srcdir"
  msg2 "Packing..."
  install -D -m755 qSeedFuck ${pkgdir}/usr/bin/qseedfuck
}
