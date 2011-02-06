# Contributor: Daniel Kozák <kozzi11@gmail.com>
pkgname=quanta-doc-mysql5
pkgver=20051117
_realname=mysql5-quanta-doc
pkgrel=1
pkgdesc="MySQL documentation for quanta."
arch=('i686' 'x86_64')
url="http://quanta.kdewebdev.org/releases.php#documentation"
depends=('quanta')
license=('gpl')
groups=('quanta-doc')
source=( http://downloads.sourceforge.net/sourceforge/quanta/$_realname-$pkgver.tar.bz2 install.sh )
md5sums=('9ad429e656f93aa47ed831e966500cc4' 'e70a2ea6e375407e4dbce099724662e3')

build() {
  cd $startdir/src/mysql5
  cp -f $startdir/install.sh install.sh
  ./install.sh $startdir/pkg
} 
