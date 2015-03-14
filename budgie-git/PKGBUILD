# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel Sandman <revoltism@gmail.com>

pkgname=budgie-git
pkgver=2.r135.gc2fce82
pkgrel=1
pkgdesc="simple and distraction free GTK+ media player created by Ikey Doherty. Written in C."
arch=('i686' 'x86_64')
url="http://ikeydoherty.github.io/budgie/"
license=('GPL2')
depends=('gtk3' 'glib2' 'gst-plugins-base-libs' 'id3lib' 'xdg-user-dirs' 'gdbm' 'dconf' 'gsettings-desktop-schemas' 'desktop-file-utils')
makedepends=('git')
conflicts=('musicplayer' 'budgie')
provides=('budgie-media-player')
install='budgie-git.install'
#source=("$pkgname"::'git+https://github.com/evolve-os/budgie-media-player.git#branch=master')
source=("$pkgname::git+https://bitbucket.org/11doctorwhocanada/budgie-media-player.git")
md5sums=('SKIP')


pkgver() {
     cd "$srcdir/$pkgname"
     git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
     cd "$srcdir/$pkgname"
     ./autogen.sh
     ./configure --prefix=/usr --disable-schemas-compile
     make
}

package() {
     cd "$srcdir/$pkgname"
     make PREFIX=/usr DESTDIR="$pkgdir" install
     install -D -m644 README.mkd "$pkgdir/usr/share/doc/$pkgname/README"
     install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
