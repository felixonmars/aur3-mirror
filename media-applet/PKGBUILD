pkgname=media-applet
pkgver=0.4
pkgrel=2
pkgdesc="A gnome applet to easily mount/unmount removable media based on ejecter(0.0.9) project"
arch=('i686' 'x86_64')
url="http://live.gnome.org/media-applet"
license=('GPL3')
depends=('gnome-panel' 'libnotify')
makedepends=('vala057' 'python' 'intltool')
conflicts=('media-applet-svn')
source=(http://media-applet.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('8484ddbdf373fc983a65c878ef64c2b6')
sha1sums=('6adce9ba94d3eb960c12e6a6b4efde21e7c4e77c')


build() {

  cd $startdir/src/$pkgname-$pkgver
  ./waf configure --prefix=/usr
  ./waf
  ./waf install --destdir="$pkgdir"
}

