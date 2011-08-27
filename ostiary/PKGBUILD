# Contributor: Jonathan Stott <jonathan.stott@gmail.com>
pkgname=ostiary
pkgver=4.0
pkgrel=1
pkgdesc="A daemon to allow you to run a fixed set of commands remotely"
arch=('i686' 'x86_64')
url="http://ingles.homeunix.net/software/ost/index.html"
license=('GPL')
backup=('etc/ostiary.cfg')
install=
source=(http://ingles.homeunix.net/software/ost/latest/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=(420d1fda246097d7e4d1277f39069578)
sha1sums=(725a966d4eb97b69d1b6407011bb6bfabc7ae82b)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=$pkgdir/usr --sysconfdir=$pkgdir/etc
  make || return 1
  make install
}

# vim:set ts=2 sw=2 et:
