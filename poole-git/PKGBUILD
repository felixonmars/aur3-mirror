# Maintainer:  <clu>
pkgname=poole-git
_pkgname=poole
pkgver=b6c78389d575
pkgrel=2
pkgdesc="A damn simple static website generator."
url="http://bitbucket.org/obensonne/poole/src"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python2' 'python-markdown')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://bitbucket.org/obensonne/$_pkgname/get/$pkgver.tar.gz")
md5sums=('584c51b7d8dc385d1ac7ca9c6aefdde7')
#source=($pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$_pkgname

  mkdir -p $pkgdir/usr/local/bin
  cp -f poole.py $pkgdir/usr/local/bin
}