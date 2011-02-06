# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=goo
pkgver=0.155
pkgrel=2
pkgdesc="Type-based prefix syntaxed language that is simple, powerful and extensible."
arch=('i686')
url="http://www.googoogaga.org"
license=('GPL')
depends=('gc' 'gmp')
source=(http://people.csail.mit.edu/jrb/goo/goo-0_155-any-dev.tar.gz
        boot.patch)
md5sums=('8c4d2d9b68554817cb6a053bf8bef202'
         '7420de638dc9ea102c4f8befa5da4e2d')

build() {
  cd $startdir/src/goo-0_155-any-dev
  patch -p1 < ../boot.patch || exit 1
  ./configure --prefix=$startdir/pkg/usr

  # YES, I KNOW THIS IS UGLY.
  # It's also the only way I found to make it work.
  # at least on my box.

  cd $startdir/src/goo-0_155-any-dev/c/g2c
  make 2> /dev/null
  rm goo.o
  make 2> /dev/null
  cd $startdir/src/goo-0_155-any-dev/c
  make || return 1
  cd $startdir/src/goo-0_155-any-dev
  make || return 1
  make DESTDIR=$startdir/pkg install || exit 1
}
