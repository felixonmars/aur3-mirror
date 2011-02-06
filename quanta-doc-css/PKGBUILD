# Contributor: Daniel Kozák <kozzi11@gmail.com>
pkgname=quanta-doc-css
pkgver=20041123
pkgrel=1
pkgdesc="Css documentation for quanta."
arch=('i686' 'x86_64')
url="http://quanta.kdewebdev.org/releases.php#documentation"
depends=('quanta')
license=('gpl')
groups=('quanta-doc')
source=( http://downloads.sourceforge.net/sourceforge/quanta/css.tar.bz2 install.sh )
md5sums=('365401c41fbefe56c05a5bd16e0d7354' 'b90019242ea36fa0657003125c548f4b')

build() {
  cd $startdir/src/css
  cp -f $startdir/install.sh install.sh
  ./install.sh $startdir/pkg
} 
