# Contributor: Dmitriy Morozov <archlinux@foxcub.org> 
pkgname=crosstex
pkgver=0.5.6
pkgrel=1 
pkgdesc="Modern object-oriented bibliography management tool designed to replace BibTeX."
url="http://www.cs.cornell.edu/people/egs/crosstex/"
arch=('i686')
license="GPL" 
depends=('python' 'ply') 
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz) 
md5sums=('0c779d1a9f286f995a91e7330bb1f56c')

build() { 
 cd $startdir/src/$pkgname-$pkgver
 make PREFIX=$startdir/pkg/usr install
 sed "s/xtxlib = .*/xtxlib = '\/usr\/share\/crosstex'/" < $startdir/pkg/usr/bin/crosstex > $startdir/pkg/usr/bin/crosstex.new
 sed "s/plylib = .*/plylib = xtxlib/" < $startdir/pkg/usr/bin/crosstex.new > $startdir/pkg/usr/bin/crosstex
 rm $startdir/pkg/usr/bin/crosstex.new
}
