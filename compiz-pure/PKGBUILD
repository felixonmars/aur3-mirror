# Maintainer: insm <gminsm@gmail.com>

pkgname=compiz-pure
pkgver=0.8.6
pkgrel=2
pkgdesc="this is pure compiz. because this package contains gtk-window-decorator, compiz can be executed without using other packages(like gnome,kde,emerald,metacity,fusion...)."
url="http://www.go-compiz.org/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('librsvg' 'libgl' 'dbus' 'mesa' 'libxslt')
makedepends=('intltool')
options=(!libtool !emptydirs)
conflicts=('compiz' 'compiz-core' 'compiz-core-git' 'compiz-git')
source=(http://releases.compiz.org/$pkgver/compiz-$pkgver.tar.gz)

md5sums=('af0586557e0291c47b924e33bccacc60')

build()
{
  cd $srcdir/compiz-$pkgver

  ./configure \
		--prefix=/usr \
		--enable-shared \
	    --enable-gtk \
	    --enable-dbus \
		--enable-librsvg \
		--enable-glib \
	    --disable-gconf \
	    --disable-gnome \
	    --disable-gnome-keybindings \
	    --disable-metacity \
	    --disable-kde \
	    --disable-kde4 \
		--disable-static \
		--disable-inotify \
        
  make || return 1
  make DESTDIR=$pkgdir install
}

