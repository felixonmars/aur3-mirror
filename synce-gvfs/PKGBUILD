# Contributor: Sergey Kolesov <cucullus.at.mail.ru>
pkgname=synce-gvfs
pkgver=0.7.1
pkgrel=1
pkgdesc="An implementation of a gvfs backend for SynCE"
url="http://www.synce.org"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('intltool')
depends=('gvfs' 'synce-rra' 'shared-mime-info') #'synce-hal' 
install=${pkgname}.install

_gvfs_ver_major=1.16
_gvfs_ver_minor=3
source=(http://downloads.sourceforge.net/sourceforge/synce/$pkgname-$pkgver.tar.gz
	http://ftp.gnome.org/pub/gnome/sources/gvfs/${_gvfs_ver_major}/gvfs-${_gvfs_ver_major}.${_gvfs_ver_minor}.tar.xz)

md5sums=('e47b2605fa5786e3f972dfb5baa8006c'
         '122f20b25a5e0259a3d33be25113a0aa')
         
build() {
   cd $srcdir/$pkgname-$pkgver

   ./configure --prefix=/usr --libexecdir=/usr/lib/gvfs \
	--with-gvfs-source=../gvfs-${_gvfs_ver_major}.${_gvfs_ver_minor}
   make
}

package() {
   cd $srcdir/$pkgname-$pkgver

   make DESTDIR="$pkgdir" install
}
