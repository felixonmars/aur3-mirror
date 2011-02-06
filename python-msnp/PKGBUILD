# Contributor: Roberto Alsina@kde.org
pkgname=python-msnp
pkgver=0.4.1
pkgrel=1
pkgdesc="A Python MSN messenger protocol library"
arch=( 'i686' )
url="http://msnp.sourceforge.net/"
license=('GPL')
source=(http://downloads.sourceforge.net/msnp/msnp.py-0.4.1.tar.gz)
md5sums=('8e09e7126ad6b14a789ba4cd9178f9d2')

build() {
  cd "$srcdir/msnp.py-$pkgver"
  python setup.py bdist_dumb || return 1
  cd $startdir/pkg
  tar xzvf $startdir/src/msnp.py-$pkgver/dist/msnp.py-$pkgver.linux-i686.tar.gz
}

# vim:set ts=2 sw=2 et:
