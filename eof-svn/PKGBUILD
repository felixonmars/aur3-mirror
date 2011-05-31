pkgname=eof-svn
pkgver=20110531
pkgrel=1
pkgdesc="A song editor for Frets on Fire"
arch=('i686' 'x86_64')
url="http://http://code.google.com/p/editor-on-fire/"
license=('BSD')
depends=('allegro' 'zlib' 'libpng' 'libogg' 'libvorbis')
makedepends=('subversion')
source=('EoF' 'EoF.desktop')
md5sums=('c1f9788f91e7fd47c955451bda6e82fb' 'a78ec3a756bd390438bcf85192ae1282')
install=eof.install
 
build() {
  cd ~/Sources
  if [ -d eof ]; then
    cd eof && svn up
  else
    svn co http://editor-on-fire.googlecode.com/svn/trunk/ eof
    cd eof
  fi
  make
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/eof
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/licenses/eof
  cp EoF $pkgdir/usr/bin
  cp EoF.desktop $pkgdir/usr/share/applications/
  cd ~/Sources/eof
  cp license.txt $pkgdir/usr/share/licenses/eof/
  cp -r bin $pkgdir/usr/share/eof/
  mv $pkgdir/usr/share/eof/bin/eof.ico $pkgdir/usr/share/pixmaps/EoF.ico
  chmod -R 777 $pkgdir/usr/share/eof
  make clean
}
