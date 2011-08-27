# Contributor: Zhou Xin <soul916@hotmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=twill
pkgver=0.9
pkgrel=6
pkgdesc="twill is a simple language that allows users to browse the Web from a command-line interface. With twill, you can navigate through Web sites that use forms, cookies, and most standard Web features."
url="http://twill.idyll.org/"
license=('MIT')
depends=('python2' 'python-mechanize' 'python-clientform' 'pyparsing')
makedepends=('python2')
provides=("twill=${pkgver}-${pkgrel}")
arch=('any')
source=(http://darcs.idyll.org/~t/projects/$pkgname-$pkgver.tar.gz
	fix_history_path.patch
	remove_ext.patch)

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < $srcdir/fix_history_path.patch
  patch -p1 < $srcdir/remove_ext.patch
  install -D doc/LICENSE.txt $pkgdir/usr/share/licenses/twill/LICENSE
  python2 setup.py install --root=$pkgdir bdist_dumb
}
md5sums=('c362307616696f4838e9456c42b70fdc'
	 '5cd3171f489a36ebbdf2a0fbc79b57a6'
	 '8eb0137a5cd9dfdf20967be94d3a9dea')
