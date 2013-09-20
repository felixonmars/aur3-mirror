# Maintainer: M. F. Riley <mfr@hacari.org>

_pkgname=scrot
pkgname=$_pkgname-patched
pkgver=0.8
pkgrel=13
pkgdesc="A simple command-line screenshot utility for X, with Debian's patches"
arch=('i686' 'x86_64')
url="http://scrot.sourcearchive.com/"
license=('MIT')
depends=('giblib')
source=(http://linuxbrit.co.uk/downloads/$_pkgname-$pkgver.tar.gz
    01_manpagefix.patch
    02_options.c.patch
    003_descmanpage.patch
    04-focused.patch
    05-addfocusedmanpage.patch
    06_manpagespace.patch
    07_fix-formatstring.patch
    08_fix-beeping.patch)
md5sums=('ccae904d225609571bdd3b03445c1e88'
    'efcfbe55c7d52a0d5a3b942deaf387bd'
    'eda5bbdb7cb792c5fa5ef0131d22e894'
    'c590ff9b9332108b3f0ca0aa8f838c91'
    'b52d72dcc7c1972d6f03669e0563b289'
    '6a326fbe7aed09d7661849492781fb12'
    '3b0cf124546d160df8276f950e6a3d69'
    '20c92129724abe14c10b80de25d66fea'
    '4549195d22fc010a095720b4f2a10fe0')
provides=('scrot')
conflicts=('scrot')

build() {
  cd $srcdir/$_pkgname-$pkgver

  patch -p1 < $srcdir/01_manpagefix.patch
  patch -p1 < $srcdir/02_options.c.patch
  patch -p1 < $srcdir/003_descmanpage.patch
  patch -p1 < $srcdir/04-focused.patch
  patch -p1 < $srcdir/05-addfocusedmanpage.patch
  patch -p1 < $srcdir/06_manpagespace.patch
  patch -p1 < $srcdir/07_fix-formatstring.patch
  patch -p1 < $srcdir/08_fix-beeping.patch

  ./configure --prefix=/usr \
              --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  make DESTDIR=$pkgdir docsdir=/usr/share/doc/scrot install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
