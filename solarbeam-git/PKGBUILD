# Maintainer: TDY <tdy@gmx.com>

pkgname=solarbeam-git
pkgver=20091206
pkgrel=1
pkgdesc="An application for drawing solar diagrams"
arch=('i686' 'x86_64')
url="http://solarbeam.sourceforge.net/"
license=('GPL')
depends=('mono>=2.0')
makedepends=('git' 'monodevelop')
source=($pkgname.sh)
md5sums=('aafab7ec952935d60da0df9f680e731a')

_gitroot=git://solarbeam.git.sourceforge.net/gitroot/solarbeam
_gitname=solarbeam

build() {
  cd "$srcdir"

  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
  else
    git clone $_gitroot
  fi

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  make zip || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  bsdtar -xf dist/$_gitname.zip -C "$pkgdir/opt"
  install -Dm755 ../$pkgname.sh"$pkgdir/usr/bin/$_gitname-git"
}
