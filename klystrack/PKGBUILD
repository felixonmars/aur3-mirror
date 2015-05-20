# Maintainer: you, if you want
# Contributor: Emanuel Guével (PotatoesMaster) <guevel.emanuel at gmail dot com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=klystrack
pkgver=1.6.1
pkgrel=2
pkgdesc="A chiptune tracker. It is comparable to AHX on the Amiga."
arch=('i686' 'x86_64')
url="http://kometbomb.github.io/klystrack/"
license=('MIT')
depends=('sdl2' 'sdl2_image')
makedepends=('klystron-git' 'git')

conflicts=('klystrack-svn')

source=('klystrack.desktop')
md5sums=('9e92785113c8f170e776b89df0531652')

build() {
    cd "$srcdir"
    cp -fr /usr/share/klystron "$srcdir"

    git clone 'https://github.com/kometbomb/klystrack.git' "$pkgname"
    cd "$srcdir/$pkgname"
    git reset --hard "$pkgver"

    make
}

package() {
    mkdir -p "$pkgdir/usr/share/klystrack"
    mkdir -p "$pkgdir/usr/lib/klystrack"
    mkdir -p "$pkgdir/usr/bin"

    #desktop icons
    mkdir -p "$pkgdir/usr/share/pixmaps"
    mkdir -p "$pkgdir/usr/share/applications"

    cd "$srcdir/$pkgname"

    cp "icon/256x256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    install -D -m644 "$startdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    #deploy
    cp -fr "bin.debug/klystrack" "$pkgdir/usr/bin/klystrack"
    chmod +x "$pkgdir/usr/bin/klystrack"

    for i in res key; do
        cp -fr $i "$pkgdir/usr/lib/klystrack"
        rm -fr "$pkgdir/usr/lib/klystrack/$i/.svn"
    done

    for i in doc icon examples; do
        cp -fr $i "$pkgdir/usr/share/klystrack"
        rm -fr "$pkgdir/usr/share/klystrack/$i/.svn"
    done

    rm -fr "$pkgdir/usr/share/klystrack/examples/instruments/.svn"
    rm -fr "$pkgdir/usr/share/klystrack/examples/songs/.svn"
}
