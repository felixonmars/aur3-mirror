# Contributor: Daniel Kozák <kozzi11@gmail.com>
pkgname=quanta-doc-html
pkgver=20041123
pkgrel=1
pkgdesc="Html documentation for quanta."
arch=('i686' 'x86_64')
url="http://quanta.kdewebdev.org/releases.php#documentation"
depends=('quanta')
license=('gpl')
groups=('quanta-doc')
source=( http://downloads.sourceforge.net/sourceforge/quanta/html.tar.bz2 install.sh )
md5sums=('2be9c55d9795faa46cb094a1919e9c89' '438ec1682d615fc3876c0198ede7b62d')

build() {
  cd $startdir/src/html
  cp -f $startdir/install.sh install.sh
  ./install.sh $startdir/pkg
} 
