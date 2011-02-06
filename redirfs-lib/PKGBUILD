# Maintainer: Henry Jensen <hjensen@delilinux.de>

pkgname=redirfs-lib
pkgver=0.6
pkgrel=1
pkgdesc="Redirecting FileSystem with Anti-Virus Filter - Libraries"
arch=('i686' 'x86_64')
url="http://www.redirfs.org"
license=('unknown')
depends=('glibc' 'redirfs-modules')
source=(http://www.redirfs.org/packages/librfsctl-0.0.0.tar.gz \
        http://www.redirfs.org/packages/libavfltctl-1.0.0.tar.gz \
	http://www.redirfs.org/packages/libav-0.1.0.tar.gz \
	librfsctl-0.0.0.patch
	libavfltctl-1.0.0.patch
	libav-0.1.0.patch
        )
md5sums=('14a3f48a81c055e44844645035c0f1ab'
         'abf058c3aafb9a324a62e6ee5ff62b3d'
         'b8972a86cc55327a94e22df885d4c292'
         '3378f593842d6837234714ba8195c74d'
         'f2366d1819df5d75b019467ebc7b42fd'
         '5292abdcc84fbf9c959403ef9650b10b')


build() {
  cd "$srcdir/librfsctl-0.0.0"
  patch -p1 < ../librfsctl-0.0.0.patch
  make || return 1
  mkdir -p "$pkgdir"/usr/{lib,include}
  make DESTDIR="$pkgdir" install
  
  cd "$srcdir/libavfltctl-1.0.0"
  patch -p1 < ../libavfltctl-1.0.0.patch
  export CFLAGS="$CFLAGS -I$srcdir/librfsctl-0.0.0 -L$srcdir/librfsctl-0.0.0"
  make || return 1
  make DESTDIR="$pkgdir" install
  
  cd "$srcdir/libav-0.1.0"
  patch -p1 < ../libav-0.1.0.patch
  make || return 1
  make DESTDIR="$pkgdir" install
}

