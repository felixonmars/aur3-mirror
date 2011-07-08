pkgname=misteek-icon-theme
_pkgname=mistEEk
pkgver=3
pkgrel=2
pkgdesc='An icon theme for the gnome desktop that aspires to be crisp, colorful and easy on the eyes .... '
arch=('i686' 'x86_64')
depends=('gtk-engines' 'gtk-engine-murrine')
license=('GPL')
url=('http://charleswight.deviantart.com/art/mistEEk-3-160930596')
source=(http://fc05.deviantart.net/fs71/f/2010/106/4/b/mistEEk_3_by_charleswight.zip)

md5sums=('dfbafd3bf01293dad7d5233a73bde15b')

build() 
{
  cd $srcdir
  unzip mistEEk_3_by_charleswight.zip
  tar -xjf $_pkgname-$pkgver.tar.bz2
  cd $_pkgname
  mkdir -p $pkgdir/usr/share/icons/$_pkgname
  cp -R ./* $pkgdir/usr/share/icons/$_pkgname
}
