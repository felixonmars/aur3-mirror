# Contributor: Gianfranco Micoli <gianfrix.mg@gmail.com>

pkgname=quakebased-mpd-binder
pkgver=1.0
pkgrel=1
pkgdesc="A 'Now Playing' binder for Quake based games for MPD users using MPC written in Bash"
arch=(i686)
url="http://www.gianfrixblog.co.cc"
license=('GPL')
depends=('mpd' 'mpc')
source=('mpdsongbinder.sh')
md5sums=('1c5474c09f04f2f926141749b109ff58')

build() {
  cd "$srcdir/"
  install -D -m 755 mpdsongbinder.sh $pkgdir/usr/bin/mpdsongbinder.sh
}
