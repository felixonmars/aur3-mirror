# Maintainer: James Reed <supplantr at archlinux dot info>

_pkgname=mon
pkgname=$_pkgname-git
pkgver=20130715.77
pkgrel=1
pkgdesc='Simple single-process process monitoring program written in C'
arch=('i686' 'x86_64')
url='https://github.com/visionmedia/mon'
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://github.com/visionmedia/mon.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 mon "$pkgdir/usr/bin/mon"
}
