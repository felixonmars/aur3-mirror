# Maintainer: Rob Ellis <rob at alt9.org>
# Contributor:  Leslie P. Polzer <polzer@stardawn.org>
#				Stefan Husmann <stefan-husmann@t-online.de>

pkgname=efltk
pkgver=2.0.8
pkgrel=1
pkgdesc="Extended version of the GUI toolkit FLTK."
arch=('i686' 'x86_64')
url="http://equinox-project.org/"
license=('LGPL')
depends=('libpng' 'libjpeg')
source=(efltk-2.08-filename_list_compile_error.patch \
	http://downloads.sourceforge.net/project/ede/efltk/2.0.8/$pkgname-$pkgver.tar.gz)
md5sums=('91c0115b032699966d7e2bab7836e9ea'
         '0596f27273cfb8169856009bfb611a1d')

build() {
  cd $srcdir/$pkgname
  
  ./configure --prefix=/usr \
	--disable-mysql --disable-unixODBC
	
	patch -p1 < ../efltk-2.08-filename_list_compile_error.patch || return 1
	./emake || return 1
	install -d $pkgdir/usr/{bin,lib} || return 1
	./emake prefix=$pkgdir/usr install || return 1  
}
