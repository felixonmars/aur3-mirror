# Author: Andrew Gregory
# Mainteiner:     mmm 
pkgname=makepkg-meta-git
pkgver=97242c5
pkgrel=1
pkgdesc="create and install custom meta-packages, manage dependencies"
arch=('any')
url="https://github.com/andrewgregory/makepkg-meta"
license=('MIT')
depends=('bash' )
makedepends=('perl' )
provides=('makepkg-meta')
source=('git+git://github.com/andrewgregory/makepkg-meta.git')
md5sums=('SKIP')

pkgver() {
  cd makepkg-meta
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build()
{
  cd $srcdir/makepkg-meta
  PREFIX="/usr" DESTDIR="$pkgdir" make all
}

package()
{
  cd $srcdir/makepkg-meta
  mkdir -p $pkgdir/usr/bin
  PREFIX="/usr" DESTDIR="$pkgdir" make install 
}
