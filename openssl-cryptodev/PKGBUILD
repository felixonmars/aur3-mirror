# Maintainer: Joakim Reinert <mail[at]jreinert[dot]com>
_pkgname=openssl
pkgname=${_pkgname}-cryptodev
_ver=1.0.1e
# use a pacman compatible version scheme
pkgver=1.0.1.e
#pkgver=$_ver
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security with cryptodev support'
arch=('armv7h')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl' 'cryptodev-linux')
conflicts=('openssl')
provides=('openssl')
optdepends=('ca-certificates')
options=('!makeflags')
backup=('etc/ssl/openssl.cnf')
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"
        "https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz.asc"
        'no-rpath.patch'
        'ca-dir.patch'
        'openssl-1.0.1e-fix_pod_syntax-1.patch')
md5sums=('66bf6f10f060d561929de96f9dfe5b8c'
         'SKIP'
         'dc78d3d06baffc16217519242ce92478'
         '3bf51be3a1bbd262be46dc619f92aa90'
         '88d3bef4bbdc640b0412315d8d347bdf')

build() {
  cd $srcdir/$_pkgname-$_ver

  # remove rpath: http://bugs.archlinux.org/task/14367
  patch -p0 -i $srcdir/no-rpath.patch
  # set ca dir to /etc/ssl by default
  patch -p0 -i $srcdir/ca-dir.patch

  patch -p1 -i $srcdir/openssl-1.0.1e-fix_pod_syntax-1.patch

  # mark stack as non-executable: http://bugs.archlinux.org/task/12434
  ./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
    shared zlib ${optflags} \
    "${openssltarget}" \
    -Wa,--noexecstack -DHAVE_CRYPTODEV -DUSE_CRYPTDEV_DIGESTS "${CFLAGS}" "${LDFLAGS}" linux-armv4

  make depend
  make
}

check() {
  cd $srcdir/$_pkgname-$_ver
  # the test fails due to missing write permissions in /etc/ssl
  # revert this patch for make test
  patch -p0 -R -i $srcdir/ca-dir.patch
  make test
  patch -p0 -i $srcdir/ca-dir.patch
}

package() {
  cd $srcdir/$_pkgname-$_ver
  make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
