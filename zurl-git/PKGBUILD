# Maintainer: Daniel Wallace (gtmanfred) <daniel.wallace at gatech dot edu>
pkgname=zurl-git
_pkgname=zurl
pkgver=20120805
pkgver() {
  git describe --tags | sed 's/-/./g;s/^v//'
}
pkgrel=1
epoch=1
pkgdesc="zsh url launcher, originally written to be used with URxvt keyboard-selet launcher. Does some Image sites. Currently developing"
arch=('i686' 'x86_64')
url="http://code.gtmanfred.com"
license=('unknown')
install=$pkgname.install
source=($pkgname.install)
depends=('zsh')
optdepends=('youtube-viewer: for opening youtube with default settings'
            'gvim: for vim servers or vim compiled with the server ./configure'
            'mplayer: default gif and video player'
            'firefox: default $BROWSER'
            'tmux: default multiplexer'
            'feh: default image viewer'
            'curl: https sites')

source=("$_pkgname::git://code.gtmanfred.com/zurl.git")
md5sums=('SKIP')


package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname.zsh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "${_pkgname}rc" "$pkgdir/etc/${_pkgname}rc"
}

# vim:set ts=2 sw=2 et:
