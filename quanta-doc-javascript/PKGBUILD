# Contributor: Daniel Kozák <kozzi11@gmail.com>
pkgname=quanta-doc-javascript
pkgver=20051201
pkgrel=1
pkgdesc="Javascript documentation for quanta."
arch=('i686' 'x86_64')
url="http://quanta.kdewebdev.org/releases.php#documentation"
depends=('quanta')
license=('gpl')
groups=('quanta-doc')
source=( http://downloads.sourceforge.net/sourceforge/quanta/javascript.tar.bz2 install.sh )
md5sums=('4e4945ac5b842339ecc69b4c63960529' '0be9844587a709e3480a0394498b0193')

build() {
  cd $startdir/src/javascript
  cp -f $startdir/install.sh install.sh
  ./install.sh $startdir/pkg
} 
