# Maintainer: Nevar <psi.neamf@gmail.com>
pkgname=nautilus-share-upstream
pkgver=0.7.3
pkgdesc='Share Samba files and folders through the right click menu in Nautilus.'
pkgrel=2
url="http://gnome.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('nautilus' 'libglade' 'samba' 'gnome-shell')
makedepends=('intltool')
backup=('etc/samba/usershare.conf')
install=nautilus-share.install
md5sums=('fe35c583c1df1ef7fc02b8ba0bb81a89'
         '899fd71bf91aa280508bbd0fb3b55bfc')
source=("http://ftp.gnome.org/pub/GNOME/sources/${pkgname%-*}/${pkgver%.*}/${pkgname%-*}-$pkgver.tar.xz"
        "usershare.conf")

build() {
  cd "$srcdir/${pkgname%-*}-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-*}-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dp -m0644 ${startdir}/usershare.conf ${pkgdir}/etc/samba/usershare.conf
}
