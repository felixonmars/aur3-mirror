# Contributer: giacomogiorgianni@gmail.com 

pkgname=newbreeze
_name=NewBreeze
pkgver=2.3.0
pkgrel=1
pkgdesc="Fast and light-weight File Manager (QT4)"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/NewBreeze?content=154427"
license=('LGPL')
depends=('qt4' 'imagemagick' 'libtar' 'libzip' 'qtwebkit' 'file' 'bzip2')
makedepends=('make')
#install=${pkgname}.install
#changelog=$pkgname.changelog
#source=("http://opendesktop.org/CONTENT/content-files/154427-$_name.tar.xz" "$pkgname.desktop")
source=("https://github.com/marcusbritanicus/$_name/archive/v$pkgver.tar.gz" "$pkgname.desktop")
md5sums=("0f7cce7a4958427d2e0b580733f385de" "c9376de27f779834bcd931affdf2ae3d")

build() {
  cd $srcdir/$_name-$pkgver
  #lrelease $_name.pro
  qmake-qt4 
  find . -type f | xargs -n 5 touch
  sed -i "19s|-lQtCore|-lQtCore -lz|"  "Makefile"
  sed -i '302s|$PREFIX|$$PREFIX|' "${_name}.pro"
  
  make
}

package() {
   cd "${srcdir}/$_name-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
	#mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
	#install -p -m755 "$pkgname2" "${pkgdir}/usr/bin/$pkgname"
	#install -p -m644 "${startdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/"
	#install -Dm644 $srcdir/$_name/icons/$pkgname.png  "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
