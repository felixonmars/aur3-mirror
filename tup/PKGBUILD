# Mantainer: Gianni Vialetto <gianni@rootcube.net>

pkgname=tup
pkgver=0.7
pkgrel=1
pkgdesc="A fast, file-based build system"
arch=('i686' 'x86_64')
url="http://gittup.org/tup/index.html"
license=('GPL2')
depends=('fuse' 'lua')
install='tup.install'
changelog='CHANGELOG'
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/gittup/tup/archive/v${pkgver}.tar.gz)
md5sums=('c1b7417323b1a4dfaf2f5c322d58d5cb')

build() {
  cd $pkgname-$pkgver
  # fixes `git describe` error outside of a git repository
  sed -e 's|`git describe`|0.7|g' -i Tupfile
  sh bootstrap.sh
}

# TODO: tests are broken. Why?
#check() {
#  cd $srcdir/$pkgname-$pkgver/test
#  ./test.sh
#}

package() {
  cd $srcdir/$pkgname-$pkgver

  install -d $pkgdir/usr/bin 
  install -m755 -t $pkgdir/usr/bin tup
  install -d $pkgdir/usr/share/man/man1
  install -m644 -t $pkgdir/usr/share/man/man1 tup.1
  install -d $pkgdir/usr/share/vim/vimfiles/syntax
  install -m644 -t $pkgdir/usr/share/vim/vimfiles/syntax contrib/syntax/tup.vim 
}

