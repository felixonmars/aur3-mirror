# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Etienne Wodey <alpha7 at gmx dot fr>

_pkgname=tasktimer
pkgname=tasktimer-git
pkgver=r6.7bd3e56
pkgrel=1
pkgdesc="Simple console task timer"
arch=(any)
url="http://github.com/alpha7/tasktimer"
license=('GPL')
depends=('python2-gobject')
makedepends=('git')
source=("git://github.com/jdiemz/tasktimer.git")
md5sums=('SKIP')


pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"

    install -D $_pkgname $pkgdir/usr/bin/$_pkgname
}
