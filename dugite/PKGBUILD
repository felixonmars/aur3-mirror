# Contributor: jimmy-6
# Contributor: BluePeppers <BluePeppers (at) archlinux (dot) us>

pkgname=dugite
pkgver=0.1.1
pkgrel=1
pkgdesc="XMMS2 client written in C and GTK"
arch=('i686' 'x86_64')
url="http://www.bayles.id.au/dugite/"
license=('GPL')
depends=('libglade' 'libnotify' 'xmms2')
makedepends=('gcc')
source=(http://www.bayles.id.au/$pkgname/releases/$pkgname-$pkgver.tar.gz $pkgname.desktop)
md5sums=('e099b0fbc7e348925f59d3ca247da2e6' '76d5e032e2cf847f8341de7abccce790')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./waf configure --nocache --prefix=/usr
  ./waf
  ./waf install --destdir=$pkgdir

  install -D -m 0644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  #File already in filesystem, owned by glibc
  rm $pkgdir/usr/lib/libutil.a
}

