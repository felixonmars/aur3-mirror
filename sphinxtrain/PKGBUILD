# Contributor: Mark Coolen \<mark dot coolen\@gmail dot com\>

pkgname=sphinxtrain
pkgver=1.0.8
pkgrel=1
pkgdesc="SphinxTrain - tool for creating CMU Sphinx models"
arch=(i686 x86_64)
url="http://cmusphinx.sourceforge.net"
license=('CMU')
depends=('sphinxbase' 'perl' 'python2')
provides=(sphinxtrain)
conflicts=(sphinxtrain-svn)
source=('http://sourceforge.net/projects/cmusphinx/files/sphinxtrain/1.0.8/sphinxtrain-1.0.8.tar.gz' \
        'python-python2.patch')
md5sums=('0f7155ba92fbdec169c92c1759303106' \
         '9dd191d5d90fcaad00382a646bbe5783')

build() {

cd "$srcdir"

cd $pkgname-$pkgver
patch -p1 -i ../../python-python2.patch

./configure --prefix=/usr --with-python=/usr/bin/python2

make

make DESTDIR="${pkgdir}" install

}
