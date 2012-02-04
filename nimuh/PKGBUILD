#contributor: kagan <juanynie@mi.madritel.es>

pkgname=nimuh
pkgver=1.02
pkgrel=2
pkgdesc="'Nimuh: En busca del tesoro andaluz' is a game located in Andalucia "
url="http://www.nimuh.com"
license="Creative Commons Attribution-Noncommercial-Share Alike 2.5"
arch=('i686' 'x86_64')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'expat' 'nimuh-data')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/nimuh/$pkgname-$pkgver.tar.gz nimuh.desktop nimuh.png)
md5sums=('2876f237ff7f4aa50887f844bd807f23' '3ca0c95aa13b40c38488310c4fc0dc16' '546803cf67a36953ec2894909795f3de')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

# Install desktop shortcut
  install -D -m 0644 $startdir/nimuh.desktop $startdir/pkg/usr/share/applications/nimuh.desktop

# Install icon
  install -D -m 0644 $startdir/nimuh.png $startdir/pkg/usr/share/pixmaps/nimuh.png
}