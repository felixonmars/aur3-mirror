# Contributor charly <charlyghislain@gmail.com>
pkgname=mixer.app
name=Mixer.app
pkgver=1.8.0
pkgrel=1
pkgdesc="A mixer for your dock"
url="http://www.fukt.bth.se/~per/mixer/"
license="GPL-2"
depends=(gcc libxpm)
source=(http://www.fukt.bth.se/~per/mixer/$name-$pkgver.tar.gz)
md5sums=(e2c275f16a91c52552d9e2221e18d24c)

build() {
  cd $startdir/src/$name-$pkgver
  make || return 1
  install -d $startdir/pkg/usr/bin
  install -m 755 Mixer.app $startdir/pkg/usr/bin/
}
