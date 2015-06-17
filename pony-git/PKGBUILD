pkgname=pony-git
pkgver=0.1.6.r12.gcf40f68
pkgrel=1

pkgdesc='An actor model, capabilities, high performance programming language.'
url='http://ponylang.org/'
arch=('x86_64')
license=('BSD')

options=('staticlibs' 'debug' '!strip')

depends=('zlib' 'ncurses' 'gcc-libs')
makedepends=('git' 'llvm')
checkdepends=('pcre2')
optdepends=('pcre2: Needed for the regex package.')

provides=('pony')
conflicts=('pony')

source=('git://github.com/CausalityLtd/ponyc')
install='pony-git.install'

md5sums=('SKIP')

pkgver() {
    cd ponyc
    git describe --tags | sed 's/-/.r/; s/-/./'
}

build() {
    cd ponyc
    make config=release prefix=/usr
}

check() {
    cd ponyc
    make config=release prefix=/usr test
}

package() {
    cd ponyc
    _tag="$(git describe --always --tags)"

    # The makefile is very strange and requires almost as much post-correction
    # as to simply do the installation myself.  Even with patches to the
    # makefile to stop it attempting to symlink locations it has no business
    # touching.
    #make config=release prefix=/usr destdir="$pkgdir"/usr/lib/pony/"$_tag" install

    install -Dm755 build/release/ponyc "$pkgdir"/usr/lib/pony/"$_tag"/ponyc
    install -Dm644 build/release/libponyrt.a "$pkgdir"/usr/lib/libponyrt.a
    install -Dm644 build/release/libponyc.a "$pkgdir"/usr/lib/libponyc.a
    install -Dm644 src/libponyrt/pony.h "$pkgdir"/usr/include/pony.h

    # Ponyc is designed to read its standard packages from the same directory.
    install -dm755 "$pkgdir"/usr/bin
    ln -sf /usr/lib/pony/"$_tag"/ponyc "$pkgdir"/usr/bin/ponyc

    cp -dr --no-preserve=ownership packages/* "$pkgdir"/usr/lib/pony/"$_tag"

    # Let's include the examples as documentation is scarce.
    install -dm755 "$pkgdir"/usr/share/doc/pony
    cp -dr --no-preserve=ownership examples "$pkgdir"/usr/share/doc/pony

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
