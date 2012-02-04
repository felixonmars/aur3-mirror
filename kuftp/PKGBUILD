# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=kuftp
pkgver=1.5.0
pkgrel=2
pkgdesc="FTP client for the K Desktop Environment with tabs."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/KuFTP?content=78260"
license=('GPL')
depends=('kdelibs3')
source=(http://downloads.sourceforge.net/kuftp/$pkgname-$pkgver.tar.bz2)

md5sums=('fd79f878639f06c70cfa5b374fd4125e')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  source /etc/profile.d/qt3.sh

  ./configure --prefix=/opt/kde --without-arts
  make || return 1
  make DESTDIR="${pkgdir}" install
}
