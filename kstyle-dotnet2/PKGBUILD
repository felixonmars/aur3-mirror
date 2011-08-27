pkgname=kstyle-dotnet2
pkgver=1.5.1
pkgrel=2
pkgdesc="A dotNET-Style for KDE"
url="http://www.kde-look.org/content/show.php?content=42131"
license="GPL"
depends=('kdebase')
arch=('x86_64' 'i686')
source=(http://www.gnuton.org/blog/wp-content/uploads/2006/07/$pkgname-1-5-1-tar.gz)

md5sums=('fe7d16956e6088687829a118ddadb3a2')
sha1sums=('c1bfdfba83a1fe2d0ad2b86ce1318b1aeec1e118')


build() {
  cd $startdir/src/
  ls
  tar -xvf $pkgname-1-5-1-tar
  cd kwin-style-dotnet2-3.1.0.orig/	
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
