pkgname=muhttpd
pkgver=1.1.5
pkgrel=2
pkgdesc='Simple but complete web server'
arch=('i686 x86_64')
url='http://inglorion.net/software/muhttpd/'
license=('custom')
groups=()
depends=('glibc' 'openssl' 'zlib')
makedepends=('bzip2' 'tar' 'gcc' 'patch' 'make')
optdepends=('php: for PHP support')
provides=()
conflicts=()
replaces=()
backup=('etc/muhttpd/muhttpd.conf' 'etc/muhttpd/types.conf')
options=('zipman')
install=
source=("http://inglorion.net/download/$pkgname-$pkgver.tar.bz2" 'muhttpd-makefile.diff'
	'muhttpd-rc.d' 'muhttpd-conf.diff' 'muhttpd.service')
noextract=()
md5sums=('18e7527f11ca6662c8020ad1ded33472' '5f8eee8f2e79afb410c3288a52ebb558'
	'1d696594bce4a0847c90f47b960ea106' 'cf603b57f76736adf43034c2fcf68f78'
	'6e5f2f3d053d193a3e099f346618517d')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix /usr --mandir /usr/share/man --without-strndup || return 1
  patch < ../../muhttpd-makefile.diff || return 1
  cd conf
  patch < ../../muhttpd-conf.diff || return 1
  cd ..
  CFLAGS="$CFLAGS -trigraphs" make || return 1
  PREFIX=$pkgdir make install-package || return 1
  install -Dp -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m755 ../../muhttpd-rc.d $pkgdir/etc/rc.d/muhttpd
  install -Dp -m644 ../../muhttpd.service $pkgdir/usr/lib/systemd/system/muhttpd.service
}
