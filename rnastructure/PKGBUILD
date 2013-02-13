# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=rnastructure
pkgver=20130212
pkgrel=2
pkgdesc="RNAstructure is a complete package for RNA and DNA secondary structure prediction and analysis"
arch=(i686 x86_64)
url="http://rna.urmc.rochester.edu/RNAstructure.html"
license=('GPL')
depends=(java-environment)
source=(http://rna.urmc.rochester.edu/RNAstructureSource.tgz)
md5sums=('0e3b877b2660729a9f7b1f1127c273b6')

build() {
  cd "$srcdir/RNAstructure"
  make all
  cd RNAstructure_java_interface/
  make -j1 INCLUDEPATH1=$JAVA_HOME/include/ INCLUDEPATH2=$JAVA_HOME/include/linux/
}

package() {
  cd "$srcdir/RNAstructure"
  sed -i -e '/export DATAPATH/ i pushd $(dirname $0)' -e '/java/ a popd' exe/RNAstructureScript
  mkdir -p "$pkgdir/opt/rnastructure/"
  cp -r data_tables/ exe/ "$pkgdir/opt/rnastructure/"
}

# vim:set ts=2 sw=2 et:
