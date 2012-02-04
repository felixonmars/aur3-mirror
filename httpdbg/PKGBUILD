# Contributor : Igor Belov <i.v.belov@gmail.com>

pkgname=httpdbg
pkgver=0.8
pkgrel=1
pkgdesc="HTTP debugger proxy server."
arch=("i686" "x86_64")
license=('MIT')
url="http://www.reitshamer.com/technology/httpdbg.html"
depends=()

source=("http://www.reitshamer.com/technology/httpdbg-0.8/$pkgname-$pkgver.tar.gz")

 build() {
   cd $startdir/src/$pkgname-$pkgver
   make || return 1
   install -d $startdir/pkg/usr/bin
   install -d $startdir/pkg/usr/share/licenses/$pkgname/
   install httpdbg $startdir/pkg/usr/bin
   cp $startdir/license.txt $startdir/pkg/usr/share/licenses/$pkgname/
 }


md5sums=('7c1309658963ac16bca97c365215a10d')
