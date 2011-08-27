# Contributor:  <ndowens04@gmail.com>
pkgname=linkage
pkgver=0.2.0
pkgrel=1
pkgdesc="Linkage is a bittorrent client written in C++ using gtkmm and libtorrent."
arch=(i686)
url="http://code.google.com/p/linkage/"
license=('GPL')
conflicts=('linkage-svn')
provides=('linkage-svn' 'libtorrent-rasterbar')
depends=('gtkmm>=2.10' 'libtorrent-rasterbar>=0.13' 'libnotify' 'curl' 
'dbus-glib' 'libupnp>=1.4.1' 'libglademm' 'gconfmm' 'autoconf' 'automake' 'dbus-c++-git')
source=(http://code.google.com/p/linkage/$pkgname-$pkgver.tar.gz)
md5sums=('f844e0084d92a2f615d3cfe82024ff36')
options=(!libtool)
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$pkgdir/usr install
}
