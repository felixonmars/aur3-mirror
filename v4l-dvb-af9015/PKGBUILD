# Contributor: Berseker <berseker86@gmail.com>
pkgname=v4l-dvb-af9015
_realname=af9015
pkgver=722df797827e
pkgrel=1
pkgdesc="v4l-dvb patched with Alfatech 9016 Drivers"
arch=('i686' 'x86_64')
url="http://linuxtv.org/hg/~anttip/af9015"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('v4l-dvb')
conflicts=('v4l-dvb')
replaces=('v4l-dvb')
backup=()
#options=(!makeflags)
install=v4l-dvb-af9015.install
source=(
http://linuxtv.org/hg/~anttip/af9015/archive/tip.tar.bz2
af901x-NXP-TDA18218.patch
#https://patchwork.kernel.org/patch/82494/raw/
)

build() {
  cd "$srcdir/$_realname-$pkgver"
  
  patch -Np1 < ../af901x-NXP-TDA18218.patch

  ./configure --prefix=/usr
  make CONFIG_DVB_FIREDTV=n || return 1
  make DESTDIR="$pkgdir/" install
}
md5sums=('00174211612ec19a561f184c84b93ca8'
         '05ac406bae9c86bc42ff407fa8e9a6dc')
