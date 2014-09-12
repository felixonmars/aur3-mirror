# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Mateusz Ślażyński <ceceron@gmail.com>

pkgname=koalawriter
pkgver=1.0.1
pkgrel=1
pkgdesc="full screen, distraction free, text editor"
arch=('i686' 'x86_64')
url="http://code.google.com/p/$pkgname/"
license=('GPL3')
depends=('qt4' 'phonon-qt4')
source=("https://koalawriter.googlecode.com/files/KoalaWriter-$pkgver.tar.gz")
md5sums=('8fd8b4cd113c6cfa4607a1bafa4f6dfa')


build() {
  cd "$srcdir/KoalaWriter-$pkgver"

  qmake-qt4
  make
  make clean
}

package() {
  cd "$srcdir/KoalaWriter-$pkgver"

  mkdir $pkgdir/opt
  mv ${srcdir}/KoalaWriter-$pkgver ${pkgdir}/opt/$pkgname
  mkdir -p ${pkgdir}/usr/bin/
  cd $pkgdir/usr/bin
  ln -s ../../opt/$pkgname/KoalaWriter
  chmod -R 755 ${pkgdir}/opt/
}
