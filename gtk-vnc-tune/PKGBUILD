# Contributor: lp76 <l.peduto@gmail.com>
# Contributor: Petr Nocák <n_petr at seznam dot cz>

pkgname=gtk-vnc-tune
pkgver=0.3.5
pkgrel=1
pkgdesc="A VNC viewer widget for GTK"
arch=('i686' 'x86_64')
url="http://gtk-vnc.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'pygtk' 'gnutls')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/gtk-vnc/gtk-vnc-$pkgver.tar.gz)
md5sums=('0543994c5e3512c3762e34345c32c013')
options=(!libtool)

build() {
  cd $startdir/src/gtk-vnc-$pkgver
  ./configure --prefix=/usr --with-python --with-examples --with-gtkglext=yes
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
