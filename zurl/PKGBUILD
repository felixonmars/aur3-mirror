# Maintainer: Daniel Wallace (gtmanfred) <daniel.wallace at gatech dot edu>
pkgname=zurl
pkgver=3.0.1
pkgrel=1
pkgdesc="zsh url launcher, originally written to be used with URxvt keyboard-selet launcher. Does some Image sites. Currently developing"
arch=('i686' 'x86_64')
url="http://code.gtmanfred.com"
license=('unknown')
install=$pkgname.install
depends=('zsh>=4.3.17')
source=(http://code.gtmanfred.com/cgit/$pkgname.git/snapshot/$pkgname-$pkgver.tar.xz
        $pkgname.install)
optdepends=('youtube-viewer: for opening youtube with default settings'
            'gvim: for vim servers or vim compiled with the server ./configure'
            'mplayer: default gif and video player'
            'firefox: default $BROWSER'
            'tmux: default multiplexer'
            'feh: default image viewer')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
md5sums=('007b32c4d4f7c32d095460bf18e8c27c'
         'a59616ade065c9a06ec7cea3936aafd0')
