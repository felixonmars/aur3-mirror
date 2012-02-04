# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=span-gles
pkgver=1.2
pkgrel=1
pkgdesc="A GUI Spanish - English Translator. It will translate a phrase (via internet) or a single word (built-in dictionary)."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/span-gles/"
license=('GPL')
depends=('gtk2' 'python')
source=(http://downloads.sourceforge.net/sourceforge/span-gles/spangles-$pkgver.tar.gz)
md5sums=('8823518eb7a2803be99bb73190a2f811')

build() {
  cd $srcdir

  chmod +x span-gles
  rm spangles-$pkgver.tar.gz
  mkdir $pkgdir/opt
  cp -R ./ $pkgdir/opt/$pkgname-$pkgver
}
