# Contributor: Ivan Bobrov <ibobrik@gmail.com>

pkgname=smblansearch
pkgver=0.1.3
pkgrel=1
pkgdesc="smblansearch is set of integrated tools that help you to find and download files you need on samba shares."
arch=(i686 x86_64)
url="http://smblansearch.sourceforge.net/"
depends=('qt' 'smbclient')
source=("http://dl.sourceforge.net/sourceforge/smblansearch/$pkgname-$pkgver.tar.bz2")
md5sums=('6c570e96fda46c4e27c6a2fa179c6f28')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install || return 1
}