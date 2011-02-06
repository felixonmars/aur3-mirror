# Contributor: Václav Kramář <vkramar@email.cz>

pkgname=metacity-themes-clearbox
pkgver=20100810
_appname=clearbox
_appver=1.0
pkgrel=1
pkgdesc="Clearbox Metacity theme pack with configuration utility."
arch=('any')
url="http://clearbox.sourceforge.net/"
license=('GPL')
depends=('metacity')
source=(http://prdownloads.sourceforge.net/clearbox/clearbox-app.tar.gz
        http://prdownloads.sourceforge.net/clearbox/clearbox-themes-pack.tar.gz)
md5sums=('847a29daee61fbb0b507e6621c69bed5'
         '24ff2f5530dcb1eae5a0289fefad4b13')

build() {

# Application

  cd $srcdir/$_appname-$_appver
  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir" install

# Theme Pack

  cd $srcdir
  install -d $pkgdir/usr/share/themes
  for theme in Clearbox-*
    do
      cp -r $srcdir/$theme $pkgdir/usr/share/themes
    done

}
