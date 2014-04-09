# Contributor: William Hahn <whahn1983@gmail.com>

pkgname=wrapaur
pkgver=1.4.1
pkgrel=1
pkgdesc="A simple pacman and cower wrapper written in bash to help with everyday package tasks"
arch=('i686' 'x86_64')
url="https://github.com/whahn1983/wrapaur"
license=('GPL')
depends=('bash' 'cower' 'pacman' 'sudo' )
optdepends=('reflector: required to update mirrorlist')
source=("wrapaur")
md5sums=('969226a2b02cf8531155c21fb438a1a3')

package() {
  install -Dm755 wrapaur "$pkgdir/usr/bin/wrapaur"
}
