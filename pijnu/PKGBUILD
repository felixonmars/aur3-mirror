# Contributor: Hervé Cauwelier <herve@oursours.net>

pkgname=pijnu
pkgver=20090606
pkgrel=1
pkgdesc="Python PEG parser generator and processor (prerelease)"
arch=(i686 x86_64)
url="http://spir.wikidot.com/pijnu"
license=(GPL3)
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=http://spir.wikidot.com/local--files/pijnu/pijnu06062009.tar.gz
md5sums=('9caf88d56956e3431290d85b78cef6d1')

build() {
  pypkg=$pkgdir/usr/lib/python2.6/site-packages/$pkgname
  cd $srcdir/

  mkdir -p $pypkg
  mkdir $pypkg/booleano
  mkdir $pypkg/generator
  mkdir $pypkg/library
  mkdir $pypkg/samples
  mkdir -p $pkgdir/usr/share/doc/$pkgname

  install -m 0644 *.py testCommandLine.pijnu $pypkg
  install -m 0644 booleano/*.py $pypkg/booleano
  install -m 0644 generator/*.py $pypkg/generator
  install -m 0644 generator/pijnu.pijnu $pypkg/generator
  install -m 0644 generator/pijnu.test $pypkg/generator
  install -m 0644 library/*.py $pypkg/library
  install -m 0644 samples/*.py $pypkg/samples
  install -m 0644 doc/* $pkgdir/usr/share/doc/$pkgname
}
