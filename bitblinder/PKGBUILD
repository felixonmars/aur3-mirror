# Contributor: gillux <gillou.ray+sp4mkill3r@free.fr>
pkgname=bitblinder
pkgver=0.6.2
pkgrel=2
pkgdesc="An anonymous bittorrent client and web browser, based on TOR"
arch=('i686' 'x86_64')
url="http://www.bitblinder.com/"
license=('GPL')
# NOTE: BitBlinder can still be run without pygtk (console mode)
depends=(twisted python-m2crypto pygtk)
makedepends=(setuptools libevent)
optdepends=('psyco2-svn: makes bitblinder slightly faster and more efficient')
install=bitblinder.install
source=(http://www.bitblinder.com/media/distribution/bitblinderSource/${pkgname}_${pkgver}.tar.gz
        http://www.bitblinder.com/media/distribution/innomitorSource/innomitor_${pkgver}.tar.gz
        bitblinder.sh
        bitblinder-0.6.2.fix-python-install-path.patch)
md5sums=('114f87cc2406344cafb5baeb841b49b1'
         '4d8f5c9ada5987eac189d405471935ae'
         '9a20468e5498ea91ba38bd4d9faa6db5'
         '31c50586abc79401dd5f3fe285c6fcd7')

build() {
  cd "$srcdir/innomitor-$pkgver"
  ./autogen.sh                    || return 1
  ./configure --prefix=/usr       || return 1
  make                            || return 1
  install -Dm 755 src/or/tor "$pkgdir"/usr/bin/innomitor

  cd "$srcdir/$pkgname-$pkgver"
  make -C miniupnpc || return 1
  patch -p0 < "$startdir"/bitblinder-0.6.2.fix-python-install-path.patch
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
  install -Dm 755 "$srcdir/bitblinder.sh" "$pkgdir"/usr/bin/bitblinder
  install -Dm 755 miniupnpc/upnpc-static "$pkgdir"/usr/bin/upnpc-static
}

# vim:set ts=2 sw=2 et:
