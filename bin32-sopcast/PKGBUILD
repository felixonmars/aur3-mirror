# Contributor: Marco Maso <demind@gmail.com>

pkgname=bin32-sopcast
pkgver=3.2.6
pkgrel=1
pkgdesc="The Streaming Direct Broadcast System based on P2P"
arch=('x86_64')
url="http://www.sopcast.com"
license=('custom')
depends=(lib32-libstdc++5)
provides=('sopcast')
source=(http://download.sopcast.cn/download/sp-auth.tgz)
md5sums=('db931c9237fc93756dab7284800fa43f')
install=sopcast.install

build()  {
  install -D -m755 sp-auth/sp-sc-auth $startdir/pkg/usr/bin/sp-sc-auth
  ln -s sp-sc-auth $startdir/pkg/usr/bin/sp-sc
}
