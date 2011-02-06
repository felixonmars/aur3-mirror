# Contributor: Jacek Roszkowski <j.roszk AT gmail DOT com>
pkgname=taskbar-compiz
pkgver=3.5.10
pkgrel=1
pkgdesc="Modified Kicker taskbar applet made to work with Compiz"
arch=('i686')
url="http://www.kde-look.org/content/show.php?content=89500"
license=('GPL')
depends=(kdelibs3=$pkgver)
install='taskbar-compiz.install'
source=(http://www.kde-look.org/CONTENT/content-files/89500-$pkgname.tar.bz2)
md5sums=('d1ca68ab5a5feb78753901ed525eb637')

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR="$pkgdir/" install
}
