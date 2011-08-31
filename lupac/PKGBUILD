# Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>

pkgname=lupac
pkgver=0.0.7a
pkgrel=6
pkgdesc="A simple python script that sorts pacman's system packages by usage."
arch=('i686' 'x86_64')
url="http://git.luizribeiro.org/?p=lupac.git;a=summary"
license=('GPL')
depends=('python2' 'pacman>=3.1.0' 'sed' 'grep')
conflicts=('lupac-python2')
replaces=('lupac-python2')
source=('lupac')
md5sums=('3e6beedf33b4a71a9eefee1108a38f1a')

package(){
  mkdir -p $pkgdir/usr/bin
  cp lupac $pkgdir/usr/bin/lupac
  chmod 755 $pkgdir/usr/bin/lupac
}