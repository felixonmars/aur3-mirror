# Contributor: Tocer Deng <tocer.deng@domain.com>
pkgname=wordjoy
pkgver=0.3.0
pkgrel=2
pkgdesc="A education software that help people reciting words, based on reciteword and myword software"
arch=('i686' 'x86_64')
url="http://code.google.com/p/wordjoy/"
license=('GPL3')
depends=('python' 'pygtk')
optdepends=('wyabdcrealpeopletts: make wordjoy sound')
source=("http://wordjoy.googlecode.com/files/${pkgname}_${pkgver}.tar.bz2")
md5sums=('cc60dc60842ec4934e0395afad5d0241')

build() {
  cd "$srcdir/${pkgname}_${pkgver}"

  DESTDIR="$pkgdir/usr/share/wordjoy"
  mkdir -p $DESTDIR/{logo,glade,sound,src}
  install -D -m 644 logo/*   $DESTDIR/logo/ 
  install -D -m 644 glade/* $DESTDIR/glade/ 
  install -D -m 644 sound/* $DESTDIR/sound/ 
  install -D -m 644 src/*   $DESTDIR/src/ 
  cp -r books               $DESTDIR/
  chmod -R 0644 books

  BINDIR="$pkgdir/usr/bin"
  mkdir -p $BINDIR
  echo 'cd /usr/share/wordjoy/src/; python2 wordjoy.py' > $BINDIR/wordjoy
  chmod +x $BINDIR/wordjoy
}

# vim:set ts=2 sw=2 et:
