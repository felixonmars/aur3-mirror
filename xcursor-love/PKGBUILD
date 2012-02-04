# Contributor: MariHahn (don't contact me)
# Mantainer: Maybe you??

pkgname=xcursor-love
pkgver=0.7.3
pkgrel=1
pkgdesc="Love is in the air X Cursor Theme"
url="http://gnome-look.org/content/show.php/Love+is+in+the+air?content=127287"
depends=('libxcursor')
license=('GPL')
arch=(i686 x86_64)
source=(http://gnome-look.org/CONTENT/content-files/127287-loveisintheair.tar.gz)

build(){
  mkdir -p $pkgdir/usr/share/icons
  cp -R $srcdir/* $pkgdir/usr/share/icons/
}

md5sums=('aeb68d914207d4cd49b93a917d662c91')
