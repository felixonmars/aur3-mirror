# Contributor: halhen <halhen at k2h dot se>
pkgname=shoutcast-search
pkgver=0.4.1
pkgrel=1
pkgdesc="Search shoutcast.com radio stations"
license=(GPL)
arch=('i686' 'x86_64')
url=http://github.com/halhen/shoutcast-search
depends=('python' 'dbus-python' 'pygtk')
makedepends=('git' 'python-distribute')
source=()

build() {
    cd "$srcdir"
    msg "Connecting to git server..."

    if [[ -d "$srcdir/$pkgname" ]]; then
        (cd "$pkgname" && git pull origin master) || return 1
        msg "Repository updated"
    else
        git clone "$url.git" || return 1
        msg "Repository cloned"
    fi

    rm -rf "$srcdir/$pkgname-build"
    cp -R "$srcdir/$pkgname"{,"-build"}
    cd "$srcdir/$pkgname-build"

    msg "Using version $pkgver..."
    git checkout $pkgver 2>/dev/null || return 1

    make PREFIX=/usr MANPREFIX=/usr/man DESTDIR=$startdir/pkg install || return 1
    install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
