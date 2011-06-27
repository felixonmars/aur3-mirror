# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>

pkgname=gnomesquad
pkgver=1.0
pkgrel=1
pkgdesc="Squad based dungeon diver roguelike with very tactical gameplay."
arch=('i686' 'x86_64')
url="http://twpage.isunlimited.net/game/"
license=('custom')
depends=('python-pygame' 'python2')
source=("http://twpage.isunlimited.net/game/GnomeSquad_7DRL_Final2.zip"
        gnomesquad.sh)
md5sums=('3b67801ea1150e8277881d3e31e6ad5b'
         'f52e4785a99c4c9880cd1d6f6f8976ea')

build() {
  _dest_dir="$pkgdir/usr/share/$pkgname"
  mkdir -p $_dest_dir/{Display,GameEngine,GameLibrary,GameObjects,levels}
  chown -R :games $_dest_dir
  chmod -R g+rw $_dest_dir

  install -D -m 755 gnomesquad.sh $pkgdir/usr/bin/$pkgname

  install -D -m 644 $srcdir/*.{py,txt,TXT,png,csv} "$_dest_dir" 
  install -D -m 644 $srcdir/Display/* $_dest_dir/Display
  install -D -m 644 $srcdir/GameEngine/* $_dest_dir/GameEngine
  install -D -m 644 $srcdir/GameLibrary/* $_dest_dir/GameLibrary
  install -D -m 644 $srcdir/GameObjects/* $_dest_dir/GameObjects
  install -D -m 644 $srcdir/levels/* $_dest_dir/levels
}

# vim:set ts=2 sw=2 et:
