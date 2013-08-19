# Maintainer: James Reed <supplantr at archlinux dot info>

_pkgname=devilspie2
pkgname=$_pkgname-git
pkgver=20130811.638
pkgrel=1
pkgdesc='A window matching utility, allowing the user to perform scripted actions on windows as they are created.'
arch=('i686' 'x86_64')
url='https://github.com/gusnan/devilspie2'
license=('GPL3')
depends=('lua51' 'libwnck3')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://github.com/gusnan/devilspie2.git")
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
    make DESTDIR=$pkgdir PREFIX=/usr install
    install -Dm644 devilspie2.1 "$pkgdir/usr/share/man/man1/devilspie2.1"
    install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
}
