# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>

pkgname=snapscreenshot
pkgver=1.0.14.2
pkgrel=2
license=('GPL')
pkgdesc="Takes snapshot from your Linux console(s) and outputs a Targa file."
arch=('i686' 'x86_64')
url="http://bisqwit.iki.fi/source/snapscreenshot.html"
source=(http://bisqwit.iki.fi/src/arch/snapscreenshot-$pkgver.tar.bz2 \
  gcc4.3.patch)
md5sums=('30cb9b7af7169f8aa0e7e8560dfb2068' '466e654957642be310214c740358b3b7')

build()
{
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/{bin,share/man/man1} || return 1
  ./configure --prefix=/usr || return 1
  patch -p1 < ../gcc4.3.patch || return 1
  make BINDIR=/usr/bin \
       MANDIR=/usr/share/man \
        || return 1
  make BINDIR=$pkgdir/usr/bin \
       MANDIR=$pkgdir/usr/share/man \
        install || return 1
  chown root:root $pkgdir/usr/bin/snapscreenshot || return 1
}



