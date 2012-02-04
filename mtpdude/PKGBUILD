#Contributor: Kevin Edmonds <edmondskevin@hotmail.com>
pkgname=mtpdude
pkgver=0.0.6
pkgrel=6
pkgdesc="minimalistic application to access MTP-Based Multimedia devices."
url="http://sourceforge.net/projects/mtpdude"
depends=('libmtp=0.0.5' 'libid3tag' 'libgnomeui')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/MTPdude-$pkgver.tar.gz mtpdude.patch)
md5sums=('f75158794905f90c30a02f3fe0db0029' '0c11dc2fb36e7ba2f6ead5455ae71c55')
license="GPL"

build() {
  cd $startdir/src/MTPdude-$pkgver
  patch -Np1 -i ../mtpdude.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  
  #create the folders for the .desktop file
  mkdir -p $startdir/pkg/usr/share/applications
  #move the .desktop file to the created folder
  mv $startdir/pkg/usr/share/gnome/apps/Applications/MTPdude.desktop $startdir/pkg/usr/share/applications
  #remove the empty folders
  rm -r $startdir/pkg/usr/share/gnome
}
