pkgname=dvtitler
pkgver=0.2.0
pkgrel=1
pkgdesc="The DvTitler-Plugin works with kino's plugin engine and provides the ability to add text to your DV projects."
arch=('i686')
url="http://kino.schirmacher.de/article/archive/0"
license="GPL"
depends=('libgnomeui' 'kino')
source=(http://dfn.dl.sourceforge.net/project/dvtitler/dvtitler/0.2.0/dvtitler-0.2.0.tar.gz)
md5sums=('9498a7891ea9d3d209cc56b43fff3d17')

build() {
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/gnome/lib/pkgconfig 
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
