# Contributor: rayjgu3@gmail.com>

pkgname=xmms-shn
#origname=speex-xmms
pkgver=2.4.1
pkgrel=1
pkgdesc="An XMMS input plugin to play shorten (.shn) files."
url="http://www.etree.org/shnutils/xmms-shn/"
depends=('xmms')
arch=('i686' 'x86_64')
groups=('xmms-plugins' 'xmms-io-plugins')
source=(http://etree.org/shnutils/xmms-shn/dist/src/xmms-shn-2.4.1.tar.gz)
md5sums=('5bcdac72500091d55dce4eb0e8bed985')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

