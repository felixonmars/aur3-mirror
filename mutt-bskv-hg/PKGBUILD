# Maintainer: Bastien Dejean <nihilhill@gmail.com>

_pkgname=mutt
pkgname=${_pkgname}-bskv-hg
pkgver=6347
pkgrel=1
pkgdesc='Mutt with S-Lang and without built-in POP/SMTP/IMAP/SSL'
url='http://www.mutt.org/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('gpgme' 'slang-git' 'libidn')
makedepends=('pkgconfig' 'mercurial')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("hg+http://dev.${_pkgname}.org/hg/${_pkgname}")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    hg identify -n
}

build() {
    cd "$_pkgname"
    ./prepare \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-gpgme \
        --enable-hcache \
        --with-slang=/usr \
        --with-regex \
        --with-idn
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/bin/{flea,muttbug}
    rm "$pkgdir"/usr/share/man/man1/{flea,muttbug}.1
    rm "$pkgdir"/etc/mime.types{,.dist}
    install -D -m 644 contrib/gpg.rc "$pkgdir"/etc/Muttrc.gpg.dist
}
