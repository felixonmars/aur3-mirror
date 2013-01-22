# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Hans-Kristian Arntzen <maister@archlinux.us>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: kagan <juanynie@mi.madritel.es>

pkgname=mednafen-wip
pkgver=0.9.28
pkgrel=1
pkgdesc="A command-line multi-system gaming emulator, WIP version"
url="http://mednafen.sourceforge.net/"
license=(GPL)
arch=('i686' 'x86_64')
depends=('libcdio' 'libsamplerate' 'libogg' 'libvorbis' 'sdl' 'sdl_net' 'libsndfile' 'zlib')
makedepends=('mesa')
conflicts=('mednafen')
provides=('mednafen')
source=("mednafen-$pkgver-wip.tar.bz2"::"http://forum.fobby.net/index.php?t=getfile&id=450&")
md5sums=('2b9f0be9f77a6e1b5d26093e30b24e77')

build() 
{
   cd $srcdir/mednafen
   ./configure --prefix=/usr
   make
}

package()
{
   cd $srcdir/mednafen
   make DESTDIR=$pkgdir install
}
