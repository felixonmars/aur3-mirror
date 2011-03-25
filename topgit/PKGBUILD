# Maintainer: Peter Simons <simons@cryp.to>
# Contributor: Samuel Tardieu <sam@rfc1149.net>
# Contributor: Matt McDonald <metzen@gmail.com>

pkgname=topgit
pkgver=0.8.45.gd279e29
pkgrel=1
pkgdesc="A different patch queue manager"
url="http://repo.or.cz/w/topgit.git"
license=("GPL")
arch=('i686' 'x86_64')
depends=('git')
source=('topgit-0.8.45.gd279e29.zip::http://repo.or.cz/w/topgit.git/snapshot/d279e292a787fa733746c3d15209c70e5596ab10.zip')
md5sums=('5285e57b1eb906518b4516c8907af675')

build() {
  cd "$srcdir/$pkgname"
  make prefix=/usr DESTDIR="$pkgdir" install
}

