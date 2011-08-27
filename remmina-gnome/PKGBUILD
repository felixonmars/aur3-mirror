# Archlive <http://archlive-pkg.googlecode.com>

pkgname=remmina-gnome
pkgver=0.8.1
pkgrel=1
pkgdesc="Gnome panel applet for remmina."
#"Remmina supports multiple network protocols in an integrated and consistant user interface. Currently RDP, VNC, XDMCP and SSH are supported."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/remmina/"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::"http://downloads.sourceforge.net/project/remmina/0.8/$pkgname-$pkgver.tar.gz")
provides=()
depends=("remmina>=$pkgver" gnome-panel)
makedepends=(intltool pkgconfig gettext perl avahi)
optdepends=()

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-nls \
	--enable-avahi || return 1
  make || return 1
  make DESTDIR=${pkgdir} install
}
md5sums=('c16d5c6784749b7c948e946ed573a3c4')
