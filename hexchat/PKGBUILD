#Maintainer: TingPing tingping@tingping.se
pkgname=hexchat
pkgver=2.9.5
pkgrel=2
pkgdesc='A GTK+ based IRC client'
arch=('i686' 'x86_64')
url='http://www.hexchat.org/'
license=('GPL')
options=('!libtool')
depends=('gtk2' 'openssl' 'dbus-glib' 
	'libsexy' 'libnotify' 'libproxy' 
	'hicolor-icon-theme')
makedepends=('perl' 'python2'
             'desktop-file-utils')
optdepends=('enchant: for spell check'
            'perl: for perl plugin'
            'python2: for python plugin')
install='hexchat.install'
source=("http://dl.hexchat.org/hexchat/hexchat-$pkgver.tar.xz")
md5sums=('e9b678e439890f9842a94f657ce7ae3f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --enable-spell=libsexy --enable-textfe
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Remove gconf junk
  rm -rf "$pkgdir/usr/etc/"

  # Fix opening irc:// links
  desktop-file-edit \
    --add-mime-type='x-scheme-handler/irc;x-scheme-handler/ircs' \
    --set-key=Exec --set-value='sh -c "hexchat --existing --url %u || exec hexchat"' \
    "$pkgdir/usr/share/applications/hexchat.desktop"
}

