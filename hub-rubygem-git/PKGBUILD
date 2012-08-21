# Maintainer: Daniel Wallace: <danielwallace at gtmanfred dot com>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>

pkgname=hub-rubygem-git
pkgver=20120820
pkgrel=1
pkgdesc="hub introduces git to GitHub"
arch=('any')
url="http://defunkt.io/hub"
depends=('git' 'ruby')
makedepends=('ruby')
license=('MIT')

_gitroot=git://github.com/defunkt/hub.git
_gitname=hub
build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

  rake standalone
  gzip --best -c man/$_gitname.1> $_gitname.1.gz
}

package() {
    cd "$srcdir/$_gitname-build"
    install -D -m755 hub $pkgdir/usr/bin/$_gitname
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$_gitname/LICENSE
    install -Dm644 $_gitname.1.gz $pkgdir/usr/share/man/man1/$_gitname.1.gz
}
