# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=extrema-svn
pkgver=225
pkgrel=1
pkgdesc="Extrema is a powerful visualization and data analysis tool (SVN version)"
arch=('i686' 'x86_64')
url="http://exsitewebware.com/extrema/"
license="GPL"
depends=('wxgtk>=2.6.3')
conflicts=('extrema')
provides=('extrema')
source=(extrema.desktop)
md5sums=('SKIP')
source=(' extrema-code::svn://svn.code.sf.net/p/extrema/code/')
_svnmod=extrema-code
   
pkgver() {
  cd "$srcdir/${_svnmod}"
  svnversion
}

build() {
  cd "$srcdir"/$_svnmod/extrema/trunk
  ./reconf
  ./configure --prefix=/usr --with-wxGTK=/usr/bin/wx-config
  make 
}

package() {
  cd "$srcdir"/$_svnmod/extrema/trunk
  make DESTDIR=$pkgdir install 
  tar -jxf extrema_icons.tar.bz2
  install -Dm644 32x32/apps/extrema.png $pkgdir/usr/share/pixmaps/extrema.png
  install -Dm644 extrema.desktop $pkgdir/usr/share/applications/extrema.desktop
}


