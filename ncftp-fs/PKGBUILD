# Contributor: H.Gokhan SARI <hsa2@difuzyon.net>
pkgname=ncftp-fs
pkgver=2.4.3
pkgrel=1
pkgdesc="ncftp with fullscreen interface"
arch=(i686)
url="http://www.ncftp.com/"
license=('custom')
groups=
provides=
depends=('ncurses')
conflicts=('ncftp')
replaces=('ncftp')
backup=('etc/foo/foo.conf')
source=('ftp://ftp.ncftp.com/ncftp/ncftp-2.4.3.tar.gz')
md5sums=('5f0f3938037645707fd8e1742ce0e6f8')

build() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/man
  cd $startdir/src/ncftp-$pkgver || return 1
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  install -m755 ncftp $pkgdir/usr/bin/ncftp
}
