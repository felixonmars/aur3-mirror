# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=gospy-applet
pkgver=0.8.0
pkgrel=1
pkgdesc="A GNOME applet for detecting changes on a media."
url="http://gospy-applet.labs.libre-entreprise.org/"
license="GPL"
depends=('gnome-panel' 'gnet' 'libesmtp')
install=gospy-applet.install
source=(http://labs.libre-entreprise.org/frs/download.php/533/gospy-applet-0.8.0.tar.gz gospy-applet.install)
md5sums=('bfed2fa45b46f8e679fb7811164558c6' 'f973de3aadef381fe348568b46f4f25a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/gnome
  make || return 1
  make DESTDIR=$startdir/pkg install
}
