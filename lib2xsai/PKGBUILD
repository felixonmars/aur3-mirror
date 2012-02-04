# Contributor: rabyte <rabyte__gmail>

pkgname=lib2xsai
pkgver=1
pkgrel=1
pkgdesc="A digital image processing algorithm library"
arch=('i686' 'x86_64')
url="http://bob.allegronetwork.com/projects.html"
license=('GPL2')
source=(http://bob.allegronetwork.com/2xsai/2xsai.zip)
md5sums=('210586c14ad1c8bc2c594a8e4b818a12')

build() {
  cd $srcdir

  sed 's|aintern.h|internal/aintern.h|g' -i src/2xsai.c

  make -f makefile.uni OFLAGS="${CFLAGS}" || return 1
  make -f makefile.uni prefix=$pkgdir/usr install

  find $pkgdir -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
