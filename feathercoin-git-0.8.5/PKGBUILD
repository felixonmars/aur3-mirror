# Maintainer: Nate Nygren <nate.nygren at gmail dot com>
pkgname=feathercoin-git-0.8.5
pkgver=20131208
pkgrel=2
pkgdesc="Feathercoin is a peer-to-peer network based digital currency."
arch=('i686' 'x86_64')
url="http://www.feathercoin.com/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'qrencode')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('feathercoin')
conflicts=('feathercoin-qt' 'feathercoin')
source=("$pkgname.desktop" "$pkgname.install")
md5sums=('2c084671e0c0ec4d08918173e585b236'
         'bd7a597c9e5f32249e4c9a9ad55f2e12')

_gitroot="git://github.com/FeatherCoin/Feathercoin-0.8.5.git"
_gitname="Feathercoin-0.8.5"

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

    qmake-qt4 USE_QRCODE=1 USE_UPNP=1
    make
    cd src
    make $MAKEFLAGS -f makefile.unix feathercoind
}

package() {
    mkdir -p $pkgdir/usr/bin
    install -D -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/feathercoin.desktop
    install -D -m755 "$srcdir/$_gitname-build/feathercoin-qt" $pkgdir/usr/bin
    install -D -m644 $srcdir/$_gitname-build/share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/feathercoin128.png
    install -D -m644 "$srcdir/$_gitname-build/COPYING" "${pkgdir}/usr/share/licenses/feathercoin-git/LICENSE"
    install -D -m755 "$srcdir/$_gitname-build/src/feathercoind" "$pkgdir/usr/bin"
}
