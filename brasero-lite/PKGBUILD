# Maintainer: Laurie Clark-Michalek <bluepepper@archlinux.us>
# Maintainer: Alois Nešpor <info@aloisnespor.info>

pkgname=brasero-lite
pkgver=3.4.1
pkgrel=1
pkgdesc="A disc burning application for Gnome - suitable for non-Gnome environments"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/brasero"
license=('GPL')
options=('!libtool' '!emptydirs')
depends=('gtk3' 'gstreamer0.10-base-plugins'  'cdrkit' 'cdrdao' 'desktop-file-utils' 'hicolor-icon-theme' 'shared-mime-info' 'libcanberra' 'dvd+rw-tools' 'libsm')
makedepends=('gtk-doc' 'intltool') 
# for enable alternative back-end uncomment follow:
# makedepends=('gtk-doc' 'intltool' 'libburn' 'libisofs')
optdepends=('dvdauthor: video project'
            'gstreamer0.10-bad-plugins: video project'
            'vcdimager: video project')
replaces=('nautilus-cd-burner')
conflicts=('brasero' 'brasero-svn')
install=brasero.install
source=(http://ftp.gnome.org/pub/gnome/sources/brasero/${pkgver%.*}/brasero-$pkgver.tar.xz)
sha256sums=('e4fcd5dca1c7b0a930a43ae59953fa96db3f6beef41ceedb2f0ef8636e26a7a6')

build() {
  cd "brasero-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-caches \
      --disable-schemas-compile
  make
}

package() {
  cd "brasero-$pkgver"
  make DESTDIR=$pkgdir install
}

