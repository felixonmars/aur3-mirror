# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gshare
pkgver=0.94
pkgrel=6
pkgdesc="Easy file sharing for Gnome"
arch=('any')
url="https://launchpad.net/gshare-project"
license=('GPL')
depends=('gtk-sharp-2' 'avahi' 'gnome-sharp')
makedepends=('intltool' 'rarian')
install=$pkgname.install
options=('!makeflags')
source=(http://ftp.de.debian.org/debian/pool/main/g/gshare/${pkgname}_$pkgver.orig.tar.gz
	http://ftp.de.debian.org/debian/pool/main/g/gshare/${pkgname}_$pkgver-12.debian.tar.gz)
md5sums=('bfb05ba7502218e9d9cacc7916098a03'
         'ef649ddf942da232bbd1f8429b4f0ce7')


prepare() {
  cd $srcdir/$pkgname-$pkgver

  ls -1 ../debian/patches/*.patch | while read A; do patch -p1 <$A; done

  sed -i 's/-scrollkeeper-update/#-scrollkeeper-update/' help/C/Makefile.in
}

build() {
  export MONO_SHARED_DIR=$srcdir/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $srcdir/$pkgname-$pkgver

  [ -f Makefile ] || ./configure --prefix=/usr --sysconfdir=/usr/share --with-dbus-service-dir=/usr/share/dbus-1/services --disable-schemas-install
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  cp -dpr --no-preserve=ownership $pkgdir/usr/share/gshare/gshared.desktop $pkgdir/usr/share/applications/
  rm -r $pkgdir/usr/share/gshare
  rm -r $MONO_SHARED_DIR
}
