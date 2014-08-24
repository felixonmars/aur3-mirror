# Maintainer: Jan Dlabal <dlabaljan at gmail dot com>
# Contributions: David Becker <david dot becker 5 at gmx dot de> 
pkgname=sangband
pkgver=1.0.2
pkgrel=1
pkgdesc="Skill Angband - based on angband and Oangband"
arch=('i686' 'x86_64' 'armv6h')
url="https://code.google.com/p/skills-angband/"
license=('GPL2' 'Moria')
depends=('sdl_mixer' 'sdl_ttf')
source=("https://skills-angband.googlecode.com/files/sangband_source_102.zip")
md5sums=('b94eaf08df2e0bd08fdd282daaef32df')

build() {
  cd  $srcdir/src

  # Compile
  make -f Makefile.sdl install
}

package() {
  # Install
  mkdir -p $pkgdir/opt/$pkgname
  cp -r $srcdir/lib $pkgname $pkgdir/opt/$pkgname

  # Allow users for save files and such
  chown root:users $pkgdir/opt/$pkgname -R
  chmod 774 $pkgdir/opt/$pkgname -R

  # Put a launch script in the path
  mkdir -p $pkgdir/usr/bin
  echo \#\!/bin/sh >> $pkgdir/usr/bin/$pkgname
  echo cd /opt/$pkgname >> $pkgdir/usr/bin/$pkgname
  echo ./$pkgname >> $pkgdir/usr/bin/$pkgname
  chmod 755 $pkgdir/usr/bin/$pkgname

  # Add docs
  install -D -m644 $srcdir/docs/copying.txt "$pkgdir/usr/share/$pkgname/LICENSE"
  install -D -m644 $srcdir/docs/readme.txt "$pkgdir/usr/share/$pkgname/readme"
  install -D -m644 $srcdir/docs/manual.txt "$pkgdir/usr/share/$pkgname/manual"
  install -D -m644 $srcdir/docs/SDL.txt "$pkgdir/usr/share/$pkgname/SDL.txt"
  install -D -m644 $srcdir/docs/changes-101\ to\ 102.txt "$pkgdir/usr/share/$pkgname/changelog"
  install -D -m644 $srcdir/docs/Commands.pdf "$pkgdir/usr/share/$pkgname/Commands.pdf"
}
