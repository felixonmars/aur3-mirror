pkgname=elinks-git
pkgver=0.12pre5.r692.g3688bb9
pkgrel=1

pkgdesc='A featureful text mode web browser.'
url='http://elinks.or.cz'
arch=('i686' 'x86_64')
license=('GPL2')

depends=('js185' 'expat' 'openssl' 'lua' 'libidn' 'tre' 'xz')
makedepends=('git')
optdepends=('gpm: Console mouse support.')

conflicts=('elinks')
provides=('elinks')

source=('git://repo.or.cz/elinks.git'
        'lua_use_rawlen_instead_of_strlen.patch'
        'maybe_fix_tempnam_usage.patch')

md5sums=('SKIP'
         'c861d54fcfc50dfde1dd06159dd90cda'
         '2b003261200626caf2508e37484262e6')

pkgver() {
    cd elinks
    git describe | sed 's/^elinks-//; s/-/.r/; s/-/./'
}

prepare() {
    cd elinks
    patch -Np1 -i "$srcdir"/lua_use_rawlen_instead_of_strlen.patch
    patch -Np1 -i "$srcdir"/maybe_fix_tempnam_usage.patch
}

build() {
    cd elinks
    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-256-colors \
        --enable-true-color \
        --enable-combining \
        --enable-88-colors \
        --enable-finger \
        --enable-exmode \
        --enable-gopher \
        --enable-nntp \
        --enable-fsp \
        --enable-smb \
        --with-lzma \
        --without-x
    make
}

package() {
    cd elinks
    make DESTDIR="$pkgdir" install

    # Glibc owns this file.
    rm -f -- "$pkgdir"/usr/share/locale/locale.alias
}
