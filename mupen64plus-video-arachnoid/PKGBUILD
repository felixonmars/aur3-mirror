# Maintainer: Rob Hunter <rhunter at darkhorse dot nu>

pkgname=mupen64plus-video-arachnoid
pkgver=2.0.0
pkgrel=1
pkgdesc="Video plugin for Mupen64Plus v2.0, based on the Arachnoid plugin for Project64."
arch=('i686' 'x86_64')
license=('GPL')
depends=("mupen64plus=2.0" "glew")
url=("https://bitbucket.org/wahrhaft/mupen64plus-video-arachnoid")
source=("https://bitbucket.org/wahrhaft/mupen64plus-video-arachnoid/downloads/mupen64plus-video-arachnoid-src-2.0.0.tar.gz")
md5sums=("db720e5987d1dfd85616b03f6c0b6e73")

build() {
    cd "$srcdir/$pkgname/projects/unix"
    make clean || return 1
    make all || return 1
}

package() {
    cd "$srcdir/$pkgname/projects/unix"
    install -Dm644 mupen64plus-video-arachnoid.so $pkgdir/usr/lib/mupen64plus/mupen64plus-video-arachnoid.so

    cd "$srcdir/$pkgname"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
