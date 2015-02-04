# Maintainer: Nicky726 <Nicky726@gmail.com>
# Contributor: David Watzke

pkgname=rsync-detect-renamed
_origname=rsync
pkgver=3.1.1
pkgrel=2
pkgdesc="A file transfer program to keep remote files in sync with detect renamed support"
arch=('i686' 'x86_64')
url="http://rsync.samba.org/"
license=('GPL3')
depends=('perl' 'popt' 'acl' 'zlib')
provides=("${_origname}=${pkgver}-${pkgrel}")
conflicts=("${_origname}")
backup=('etc/rsyncd.conf' 'etc/xinetd.d/rsync')
source=("http://rsync.samba.org/ftp/rsync/src/${_origname}-${pkgver}.tar.gz"
        "http://rsync.samba.org/ftp/rsync/src/${_origname}-${pkgver}.tar.gz.asc"
        'rsyncd.conf' 'rsync.xinetd' 'rsyncd.service'
        'rsyncd.socket' 'rsyncd@.service'
        'detect-renamed.diff' 'detect-renamed-lax.diff')
md5sums=('43bd6676f0b404326eee2d63be3cdcfe'
         'SKIP'
         'bce64d122a8e0f86872a4a21a03bc7f3'
         'ea3e9277dc908bc51f9eddc0f6b935c1'
         'f90ba7f3717028769d6f230a2402b5aa'
         'ae4c381e0c02d6132c7f6ded3f473041'
         '53f94e613e0bc502d38dd61bd2cd7636'
         '264c7a82af111f5e16fa24c6ee81f0f3'
         '4f621688026d1cd8a8a331605c342333')
validpgpkeys=('0048C8B026D4C96F0E589C2F6C859FB14B96A8C5') #Wayne Davison

prepare() {
  cd "${srcdir}/${_origname}-${pkgver}"
  patch -Np1 -i ../detect-renamed.diff
  patch -Np1 -i ../detect-renamed-lax.diff
}

build() {
  cd "${srcdir}/${_origname}-${pkgver}"
	./configure --prefix=/usr \
		--with-included-popt=no \
		--disable-debug
	make
}

check() {
  cd "${srcdir}/${_origname}-${pkgver}"
	make test
}

package() {
  cd "${srcdir}/${_origname}-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
	install -Dm644 ../rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
	install -Dm644 ../rsyncd.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
	install -m644 ../rsyncd.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
	install -m644 ../rsyncd@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
	install -Dm755 support/rrsync "$pkgdir/usr/lib/rsync/rrsync"
}
