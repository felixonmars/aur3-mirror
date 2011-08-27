# Contributor: Sven 'pfleidi' Pfleiderer <pfleidi [at] roothausen.de>
pkgname=rss-torrent
pkgver=0.7.1
pkgrel=1
pkgdesc="A broadcatching application that watches RSS feeds of Twitter timelines with the ability to filter and download torrents."
url="http://swarmtv.nl/"
license=('GPL')
makedepends=('pkgconfig')
depends=('sqlite3' 'curl' 'pcre' 'libxml2' 'libesmtp')
arch=('i686' 'x86_64')
source=("http://swarmtv.nl/download/rss-torrent-${pkgver}.zip" "rsstorrent-prefix.patch")
md5sums=('3b4957e0fc0d26a194c26b6c87836150' 'a01f9bc177918f16e811635ba8f904f3')
sha1sums=('f0fce8f724a46bd7ccb32a7d5bca5ded8ffd54c4' '75888b0b8e5658b7fd32c0701f6ddced15776259')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 < $startdir/rsstorrent-prefix.patch || return 1
  cmake -DCMAKE_INSTALL_PREFIX=$startdir/pkg/usr . || return 1
  make || return 1
  make install || return 1
}


