# Maintainer: Semitsoglou-Tsiapos Dimitrios <madcatmk254@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# thx to reztho 

pkgname=veohdownloader
pkgver=13
pkgrel=5
pkgdesc="A python based veoh downloader"
arch=(i686 x86_64 i386)
url="http://code.google.com/p/veohdownloader/"
license=('GPL')
depends=('python' 'wxpython')
source=(http://$pkgname.googlecode.com/files/$pkgname-r$pkgver.tar.gz)
md5sums=('5219e62c99c6fba9ac846f3798ccea5a')

build() {
  cd $srcdir
  python setup.py install --root=$startdir/pkg
}