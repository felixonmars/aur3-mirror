# Maintainer: Rob Hunter <rhunter at darkhorse dot nu>

pkgname=mupen64plus-rsp-z64
pkgver=2.0.0
pkgrel=1
pkgdesc="Low-level RSP processor plugin for the Mupen64Plus v2.0 project. This is based on Ziggy's Z64 plugin."
arch=('i686' 'x86_64')
license=('GPL')
depends=("mupen64plus=2.0")
url=("https://bitbucket.org/wahrhaft/mupen64plus-rsp-z64")
source=("https://bitbucket.org/wahrhaft/mupen64plus-rsp-z64/downloads/mupen64plus-rsp-z64-src-2.0.0.tar.gz")
md5sums=("669e5680dadc38e5d7b580100130de5e")

build() {
    cd "$srcdir/$pkgname/projects/unix"
    make all || return 1
}

package() {
    cd "$srcdir/$pkgname/projects/unix"
    install -Dm644 mupen64plus-rsp-z64.so $pkgdir/usr/lib/mupen64plus/mupen64plus-rsp-z64.so

    cd "$srcdir/$pkgname"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
