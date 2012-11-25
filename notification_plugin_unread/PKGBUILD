org_pkgname="notification_plugin"
pkgname="${org_pkgname}_unread"
pkgver="0.31"
pkgrel="1"
pkgdesc="libnotify plugin for claws-mail with notification on unread msgs patch"
url="http://www.claws-mail.org/plugin.php?plugin=notification"
license=("GPL3")
arch=('i686' 'x86_64')
depends=("claws-mail>=3.9.0" "libnotify")
source=("http://www.claws-mail.org/downloads/plugins/$org_pkgname-$pkgver.tar.gz" unread.patch)
md5sums=('f37715f38f5f06b3a9dde607ea5c3ef8' '7cfe69d89bcf6665e90ef82415eba73b')
options=('!libtool')

build() {
  cd "$srcdir/$org_pkgname-$pkgver"
  patch -p1 <$startdir/unread.patch
  ./configure --prefix=/opt --disable-static
  make
  make DESTDIR="$startdir/pkg" install
}
