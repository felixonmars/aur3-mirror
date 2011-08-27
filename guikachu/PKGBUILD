# Contributor: William Rea <sillywilly@gmail.com>
pkgname=guikachu
pkgver=1.5.6
pkgrel=1
pkgdesc="A resource editor for PalmOS systems for Gnome"
url="http://cactus.rulez.org/projects/guikachu"
depends=('gtk2' 'libxml2' 'libgnomeuimm')
makedepends=('intltool')
install=$pkgname.install
source=(http://cactus.rulez.org/projects/$pkgname/download/$pkgname-$pkgver.tar.gz \ 
        mime.patch)
md5sums=('94c86ccca1444e8f4908bddee467444a' '129f7139a74c8187954fefb550909e0a'\

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 -i ../mime.patch
  ./configure --prefix=/opt/gnome --disable-schemas-install --disable-scrollkeeper
  make || return 1
  make DESTDIR=$startdir/pkg install
}

