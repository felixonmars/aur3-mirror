# $Id: PKGBUILD 30624 2009-03-21 03:28:13Z allan $
# Maintainer: judd <jvinet@zeroflux.org>
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>

pkgname=gettext-debian
_pkgname=gettext
pkgver=0.17
pkgrel=3
pkgdesc="GNU internationalization library, with debian patches"
arch=(i686 x86_64)
url="http://www.gnu.org/software/gettext"
license=('GPL')
groups=('base')
depends=('gcc-libs' 'acl')
optdepends=('cvs: for autopoint tool')
options=(!libtool)
provides=('gettext')
conflicts=('gettext')
install=gettext.install
source=('ftp://ftp.gnu.org/pub/gnu/gettext/gettext-0.17.tar.gz'
	'http://ftp.de.debian.org/debian/pool/main/g/gettext/gettext_0.17-10.debian.tar.gz')
md5sums=('58a2bc6d39c0ba57823034d55d65d606' 'd1b3a95a5f9d8f99815ca7654a80cd12')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  #sed -i -e 's/libexpat.so.0/libexpat.so.1/' gettext-tools/src/x-glade.c
  # applying patches
	patch -Np1 < ../debian/patches/01
        patch -Np1 < ../debian/patches/02
        patch -Np1 < ../debian/patches/03
        patch -Np1 < ../debian/patches/04
        patch -Np1 < ../debian/patches/05
        patch -Np1 < ../debian/patches/06
        patch -Np1 < ../debian/patches/07
        patch -Np1 < ../debian/patches/08
        patch -Np1 < ../debian/patches/09
        patch -Np1 < ../debian/patches/10

  ./configure --prefix=/usr --enable-csharp
  make || return 1
  make DESTDIR=$pkgdir install
  
  rm -f $pkgdir/usr/share/info/dir
  gzip -9 $pkgdir/usr/share/info/*
}
