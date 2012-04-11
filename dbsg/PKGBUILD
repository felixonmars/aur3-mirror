# Maintainer: Mauro Fruet <maurofruet@gmail.com>

pkgname=dbsg
pkgver=20120411
pkgrel=1
pkgdesc="Schedule a desktop background slideshow in GNOME 3."
arch=('any')
url='https://github.com/maurofruet/dbsg'
license=('GPL3')
depends=('gsettings-desktop-schemas')
optdepends=('cron: allow to schedule a desktop background slideshow')
makedepends=('git')

_gitroot=https://github.com/maurofruet/dbsg.git
_gitname=dbsg

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d "$_gitname" ]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        msg "Cloning $_gitroot..."
        git clone --depth=1 "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout."
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 "$_gitname" "$pkgdir/usr/bin/$_gitname"
    gzip -c "$_gitname.1" > "$_gitname.1.gz"
    install -Dm644 "$_gitname.1.gz" "$pkgdir/usr/share/man/man1/$_gitname.1.gz"
}
