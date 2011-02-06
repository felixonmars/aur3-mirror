# Contributor: raku <raczkow@gmail.com>
pkgname=kim
pkgver=0.9.5
pkgrel=3
pkgdesc="Kde Image Menu to compress, resize, convert, rename and much more (for KDE3)"
arch=(i686 x86_64)
url="http://www.kde-apps.org/content/show.php?content=11505"
license="GPL"
depends=('imagemagick' 'kdelibs3')
source=(http://bouveyron.free.fr/kim/release/$pkgname-$pkgver.tar.gz \
	install.sh.diff)
md5sums=('d25160ae3f13a8f6463fea490970fe3c'
         'cdf2ebb37fc656d263e9c7fd0256ba4d')
	 
build() {
  cd $startdir/src/$pkgname
  patch -Np0 -i $startdir/src/install.sh.diff || return 1
  
  kdeinstdir=`kde-config --prefix`
  mkdir -p $startdir/pkg/$kdeinstdir/share/apps/konqueror/servicemenus/
  mkdir -p $startdir/pkg/$kdeinstdir/bin

  startdir=$startdir ./install.sh
}
