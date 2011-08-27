# Contributor: Daniel Kozák <kozzi11@gmail.com>
pkgname=quanta-doc-php
pkgver=20051114
pkgrel=1
pkgdesc="Php documentation for quanta."
arch=('i686' 'x86_64')
url="http://quanta.kdewebdev.org/releases.php#documentation"
depends=('quanta')
license=('gpl')
groups=('quanta-doc')
source=( http://downloads.sourceforge.net/sourceforge/quanta/php.tar.bz2 install.sh )
md5sums=('2d19a72114cce1485c1c23ff28135210' 'a4f6dc2fbe8120558044ebcc90036fc4')

build() {
  cd $startdir/src/php
  cp -f $startdir/install.sh install.sh
  ./install.sh $startdir/pkg
} 
