# Contributor: Eran Yahav <eran910@gmail.com>

pkgname=gnome-gmail-notifier-svn
pkgver=0.9.4
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="A Gmail Inbox Notifier for the GNOME Desktop - svn version"
url="http://notifier.geekysuavo.org/"
makedepends=('subversion')
depends=('gtk2>=2.10.0' 'gnome-desktop>=2.16.0' 'libxml2>=2.6.20' 'libsoup>=2.2.0' 'libglade>=2.6.0' 'libnotify>=0.4.2' 'gnutls>=1.3.0' 'libofa')
md5sums=('822426b19510036d14c00ed2ea24a899')
#source=(http://files.geekysuavo.org/notifier/$pkgname-$pkgver.tar.bz2)
_svntrunk=http://gnome-gmail-notifier.googlecode.com/svn/trunk/
_svndir=gnome-gmail-notifier-0.9.4

build() {
  cd $srcdir/
  svn checkout $_svntrunk $_svndir
  cd $srcdir/$_svndir
  sh ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

