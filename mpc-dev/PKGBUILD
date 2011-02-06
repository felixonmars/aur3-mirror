pkgname=mpc-dev
pkgver=0.18
pkgrel=1
pkgdesc="Minimalist command line interface to MPD"
arch=('i686' 'x86_64')
conflicts=('mpc')
provides=('mpc')
url="http://mpd.wikia.com/wiki/Client:Mpc"
license=('GPL2')
depends=('glibc' 'libmpdclient-dev>=2.0')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/musicpd/mpc-$pkgver.tar.bz2)
md5sums=('26baf07c4076f6c39bbe97311fc8ec86')

build() {
  cd "$srcdir/mpc-$pkgver"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  # Install bash completion file
  install -D -m644 doc/mpc-bashrc "$pkgdir/etc/bash_completion.d/mpc" || 
return 1
}
