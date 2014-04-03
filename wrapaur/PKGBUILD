# Contributor: William Hahn <whahn1983@gmail.com>

pkgname=wrapaur
pkgver=1.3
pkgrel=1
pkgdesc="A simple pacman and cower wrapper written in bash to help with everyday package tasks"
arch=('i686' 'x86_64')
url="https://github.com/whahn1983/wrapaur"
license=('GPL')
depends=('bash' 'cower' 'pacman' 'sudo' )
source=("wrapaur")
md5sums=('7881b8237ae1bb655abc39cc479ef7e7')

package() {
  install -Dm755 wrapaur "$pkgdir/usr/bin/wrapaur"
}
