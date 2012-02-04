# Maintainer: Javier "Phrodo_00" Aravena <phrodo.00@gmail.com>
pkgname=gtk-gflat-engine
pkgver=0.3
pkgrel=1
pkgdesc="gFlat is a gtk-engine using cairo and is based on clearlooks. It adds lots of options for themeing."
url="http://www.gnome-look.org/content/show.php/gFlat+gtk+engine?content=39916"
depends=('gtk2' 'gtk-engines')
replaces=('gflat')
arch=('i686' 'x86_64')
license=('GPL')
source=("http://www.gnome-look.org/CONTENT/content-files/39916-gflat-${pkgver}.tar.bz2"\
	'http://www.gnome-look.org/CONTENT/content-files/43503-Gflat-Elegant.tar.gz'\ 
	'http://gnome-look.org/CONTENT/content-files/40407-Gflat-Lizard.tar.bz2'\ 
	'http://gnome-look.org/CONTENT/content-files/40011-Gflat-Human.tar.gz')
md5sums=('dea02850905add08a428d3a328c7f71a' 'b6847c9de949da772013e300d5456399'\
         'c9a89e7bbd261504688fa299c405f93a' '8ccc5c25b335666c4e9de5979ac05fa4')

build() {
  cd $srcdir/gflat
  ./configure --prefix=/usr --enable-animation
  make || return 1
  make DESTDIR=$pkgdir install
  install -m755 -d $pkgdir/usr/share/themes
  cp -r --preserve=mode $srcdir/Gflat-Elegant $pkgdir/usr/share/themes
  cp -r --preserve=mode $srcdir/Gflat-Human $pkgdir/usr/share/themes
  cp -r --preserve=mode $srcdir/Gflat-Lizard $pkgdir/usr/share/themes
}

