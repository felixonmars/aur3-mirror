# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=crossroads
pkgver=2.67
pkgrel=1
pkgdesc="Crossroads is an open source load balance and fail over utility for TCP based services."
arch=(any)
url="http://crossroads.e-tunity.com/"
license=('GPL3')
depends=('perl' 'wget')
optdepends=('perl-libwww: LWP::UserAgent will be used to replace wget')
source=(http://crossroads.e-tunity.com/downloads/$pkgname-stable.tar.gz)
md5sums=('72a259b5f1e95143e4057e1b4fb2f6bc')

build() {
  #Silly devs made a mistake so I need to set this manually
  pkgver=2.65
  
  cd "$srcdir/$pkgname-$pkgver"

  # xrctl needs to be installed first
  install -D -m 755 "$srcdir/$pkgname-$pkgver/xrctl/xrctl" "$pkgdir/usr/sbin/xrctl" || return 1
  export DESTDIR="$pkgdir"
  make local || return 1
  make install
  # Tarball comes with a pdf, which comes in handy.
  install -D -m 644 "$srcdir/$pkgname-$pkgver/doc/xr.pdf" "$pkgdir/usr/share/doc/crossroads/xr.pdf"
}

# vim:set ts=2 sw=2 et:
