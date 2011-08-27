# Maintainer: finswimmer <finswimmer77@gmail.com>

pkgname=pcmanfm-experimental
pkgver=0.4.4.2
pkgrel=1
pkgdesc="Lightweight file manager which features tabbed browsing, samba and ftp support"
arch=('i686' 'x86_64')
url="http://pcmanfm.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'hal' 'fam' 'startup-notification' 'shared-mime-info' 'desktop-file-utils' 'fuse' 'samba' 'curlftpfs' 'sshfs' 'smbnetfs')
conflicts=('pcmanfm' 'pcmanfm-experimental')
install=pcmanfm.install
source=(http://downloads.sourceforge.net/pcmanfm/pcmanfm-$pkgver.tar.gz)
md5sums=('a87decfd3adff18cc2435494960e05a8')

build() {
  cd $srcdir/pcmanfm-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
