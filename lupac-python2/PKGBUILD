# Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>

pkgname=lupac-python2
_pkgname=lupac
pkgver=0.0.7a
pkgrel=5
pkgdesc="A simple python script that sorts pacman's system packages by usage."
arch=('i686' 'x86_64')
url="http://git.luizribeiro.org/?p=lupac.git;a=summary"
license=('GPL')
depends=('python2' 'pacman>=3.1.0' 'sed' 'grep')
provides=('lupac')
source=("http://files.luizribeiro.org/${_pkgname}/${_pkgname}-$pkgver.tar.gz"
	'python.patch')
md5sums=('0515b1889151186e05de1181a51d3734'
	 'f9a31fec3fff90b455ad5104ae8c89f9')

build() {
  cd $_pkgname
  patch $_pkgname $startdir/python.patch
  install -Dm755 $_pkgname $startdir/pkg/usr/bin/$_pkgname || return 1
}
 
