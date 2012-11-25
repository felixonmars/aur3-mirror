# Maintainer: Bart Verhoeven <nepherte at archlinux dot us>

pkgname=smarteiffel
pkgver=2.3
_pkgver=2-3
pkgrel=2
pkgdesc="GNU Eiffel Compiler"
arch=('i686' 'x86_64')
url="http://smarteiffel.loria.fr"
license=('GPL')
depends=('gcc')
makedepends=()
source=("https://gforge.inria.fr/frs/download.php/2461/SmartEiffel-$_pkgver.tar.bz2"
        "serc")
md5sums=('a06dd8679e8a9cabfb5e4bc328fbf50a'
         '909ad884707dbe6186a5c082e5b5b093')

build() {
  cd $srcdir/SmartEiffel

  sed -i "s|@EIFFEL_HOME|$(pwd)|g" $srcdir/serc

  SmartEiffel=$srcdir/serc \
    make \
    USRDIR=$pkgdir/usr \
    DOCDIR=$pkgdir/usr/share/doc \
    ETCDIR=$pkgdir/etc \
    SE_PREFIX=$pkgdir \
    install
}
