# Maintainer: James Reed <supplantr at archlinux dot info>

_pkgname=notificathor
pkgname=$_pkgname-git
pkgver=20130718.61
pkgrel=1
pkgdesc='Themeable On Screen Displays for X'
arch=('i686' 'x86_64')
url='https://github.com/TheWebster/NotificaThor'
license=('BSD')
depends=('cairo>=1.12.0')
makedepends=('git' 'libxcb' 'cairo>=1.12.0' 'freetype2')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/NotificaThor/rc.conf' 'etc/NotificaThor/themes/onyx-citrus' \
        'etc/NotificaThor/themes/simple' 'etc/NotificaThor/themes/slim' \
        'etc/NotificaThor/themes/bloody-concrete')
source=("$_pkgname::git://github.com/TheWebster/NotificaThor.git")
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
    install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man" "$pkgdir/etc"
    make prefix="$pkgdir" install
}
