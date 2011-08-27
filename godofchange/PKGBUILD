# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>

pkgname=godofchange
pkgver=1.0
pkgrel=1
pkgdesc="Roguelike (7DRL) where monsters change in ability over time."
arch=('i686' 'x86_64')
url="http://code.google.com/p/godofchange/"
license=('custom')
depends=('libtcod')
source=("http://godofchange.googlecode.com/files/God%20of%20Change%20-%20Source.zip"
        "http://godofchange.googlecode.com/files/God%20of%20Change%20-%20Linux.tar.gz"
        godofchange.sh)
md5sums=('874150e44edd6a5c7ccc3ae7a67e3a51'
         'c805dcb5cab934f47c3e17492c2b4525'
         '94ac3479d2ede982a39ad26d42cace2f')

build() {
  _dest_dir="$pkgdir/usr/share/$pkgname"
  mkdir -p $_dest_dir
  chown -R :games $_dest_dir
  chmod -R g+rw $_dest_dir

  cd "$srcdir"

  g++ GodOfChange.cpp -o godofchange -L/usr/lib -I/usr/include/libtcod -ltcod -ltcodxx
  
  install -D -m 755 godofchange "$_dest_dir"
  install -D -m 644 $srcdir/terminal.png "$_dest_dir" 
  install -T -D -m 755 "$srcdir/godofchange.sh" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
