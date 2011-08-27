# Maintainer: Chris Baker <baker.chris.3@gmail.com>

pkgname=urlbst
pkgver=0.6.4
_pkgver=0.6-4
pkgrel=1
pkgdesc="Add web support to BibTeX .bst files"
arch=('i686' 'x86_64')
url="http://nxg.me.uk/dist/urlbst/"
license=('GPL')
source=(http://nxg.me.uk/dist/$pkgname/$pkgname-$_pkgver.tar.gz)
md5sums=('fd1e37644707fae06ea01f9d58799094')

build() {
  mkdir -p $pkgdir/usr/bin || return 1
  cd $srcdir/$pkgname-$_pkgver
  install -m755 $pkgname $pkgdir/usr/bin || return 1
}

