# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
pkgname=mathrl
pkgver=1.0
pkgrel=1
pkgdesc="Unconventional roguelike where math is your weapon just as much as swords and axes."
arch=('i686' 'x86_64')
url="http://vault.digitalmzx.net/show.php?id=1684"
license=('freeware')
depends=('megazeux')
source=(http://vault.digitalmzx.net/download.php?f=485b075ec13b73ec2041c5c8f582e1d61ceba20d932c7432896a2927630e0c1e
        mathrl.sh)
md5sums=('85f518d35e4b66f4bd936a3af08e31a5'
         'ad7ce33198f71d4fdbb926b59458dcfb')

build() {
  cd "mathRL"

  _dest_dir=$pkgdir/usr/share/mathrl
  mkdir -p $_dest_dir || return 1
  mkdir -p $_dest_dir/files || return 1

  install -D -m 644 *{mzm,mzx,txt} "$_dest_dir"
  install -D -m 644 files/* "$_dest_dir/files/"

  install -T -D -m 755 $srcdir/mathrl.sh $pkgdir/usr/bin/mathrl
}

# vim:set ts=2 sw=2 et:
