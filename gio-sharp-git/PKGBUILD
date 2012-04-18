# Maintainer: Mauro Fruet <maurofruet@gmail.com>
# Contributor: oke3 < Sekereg [at] gmx [dot] com >
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=gio-sharp-git
pkgver=20120418
pkgrel=1
pkgdesc="A branch of the official gtk-sharp/gio to get gio-sharp building on gtk-sharp 2.12"
url="http://github.com/mono/gio-sharp"
arch=('any')
license=('custom')
depends=('gtk-sharp-2')
makedepends=('git' 'pkgconfig' 'autoconf')
conflicts=('gio-sharp')
provides=('gio-sharp')
options=('!libtool' '!makeflags')

_gitroot="git://github.com/mono/gio-sharp.git"
_gitname="gio-sharp"

build() {
    cd "$srcdir"

    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    ./autogen-2.22.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var

    make
}

package() {
    cd "$srcdir/$_gitname-build"

    make DESTDIR="$pkgdir" install

    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
