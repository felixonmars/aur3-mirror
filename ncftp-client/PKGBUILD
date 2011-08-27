# Contributor: Silian Della Ragione <silian87@gmail.com>
pkgname=ncftp-client
pkgver=3.2.2
pkgrel=1
pkgdesc="Ncftp FTP Client"
arch=(i686)
url="http://www.ncftp.com/"
license=('custom')
groups=
provides=
depends=
conflicts=('ncftp')
replaces=('ncftp')
backup=
source=(ftp://ftp.ncftp.com/ncftp/ncftp-${pkgver}-src.tar.gz)
md5sums=('f04a6aa96b491d3d4b7a95cb3848882d')

build() {
  cd $startdir/src/ncftp-$pkgver || return 1
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  mkdir $pkgdir/usr && mkdir $pkgdir/usr/bin
  install -m755 bin/* $pkgdir/usr/bin/
}
