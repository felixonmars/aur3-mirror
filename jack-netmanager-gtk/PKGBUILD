# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=jack-netmanager-gtk
pkgver=0.2.3.1
pkgrel=2
pkgdesc="A graphical user interface for jack netmanager module, running network sources."
arch=(any)
url="http://gtk-apps.org/content/show.php/JACK+Network+Manager?content=122327"
license=('GPL')
depends=('jack' 'zenity' 'gtkdialog' 'sgrep')
optdepends=('lash: lash session support'
            'ladish: ladish session support')
install="$pkgname.install"
source=("http://gtk-apps.org/CONTENT/content-files/122327-$pkgname-$pkgver.tar.bz2")
md5sums=('1610560b85e1a4cebfa8d0a5ecc168a5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/builds/default"

  ./install "$pkgdir"
}

# vim:set ts=2 sw=2 et:
