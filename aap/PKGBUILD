#Contributor: lang2 <wenzhi.liang@gmail.com>

arch=('any')
license=('GPL')
pkgname=aap
pkgver=1.091
pkgrel=2
pkgdesc="A-A-P makes it easy to locate, download, build and install software."
url="http://www.a-a-p.org/"
depends=('python')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://heanet.dl.sourceforge.net/sourceforge/a-a-p/$pkgname-$pkgver.zip)
md5sums=('6c7820e7596bd5be5cde29030d3cdf3b')

build() 
{
  mkdir -p $startdir/pkg/usr/bin
  cd $startdir/src/
  ./aap install PREFIX=$startdir/pkg/usr
  rm $startdir/pkg/usr/bin/aap
  cd $startdir/pkg/usr/bin
  ln -s ../lib/aap/Exec-$pkgver/aap .
}

