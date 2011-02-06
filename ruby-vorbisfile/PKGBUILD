# Maintainer: Henning Bekel <h dot bekel at googlemail dot com>

pkgname=ruby-vorbisfile  
pkgver=0.2
pkgrel=2
pkgdesc="Ruby bindings for libvorbisfile, the Ogg Vorbis decoding library"
url="http://raa.ruby-lang.org/project/ruby-vorbisfile/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('ruby' 'libvorbis')
source=(http://rikkus.info/arch/ruby-vorbisfile-0.2.tar.gz $pkgname.license ruby-1.9.1.patch)
md5sums=('1772ca1c368c527b8809803fb4996b3e' '817ab0f505192773a8e7e972a45586b5'\
         'f0ed56284071d2d6e59c93d6aa85f70f')

build() {
  cd $srcdir/$pkgname-$pkgver

  if [[ "$(ruby --version)" =~ ^ruby\ 1.9 ]]; then
    patch -Np1 -i ../ruby-1.9.1.patch || return 1
  fi

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
  
  # MIT license copied from $srcdir/$pkgname-$pkversion/vorbisfile.c
  install -d $pkgdir/usr/share/licenses/$pkgname
  install -p -m 644 $srcdir/$pkgname.license $pkgdir/usr/share/licenses/$pkgname/COPYING 
}