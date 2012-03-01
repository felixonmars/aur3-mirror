# Maintainer: oke3 < Sekereg [at] gmx [dot] com >

pkgname=nunit-bzr
_pkgname=nunit
pkgver=3384
pkgrel=2
pkgdesc="A test framework for all .Net languages, running on Microsoft .NET and Mono."
arch=('any')
url="http://www.nunit.com/"
license=('custom')
depends=('mono')
makedepends=('bzr')
provides=('nunit')
conflicts=('nunit')
source=('nunit.sh' 'nunit.pc')
sha1sums=('b8c95648446b3bafc26652a9d9852aa81fc511cc'
          '4c258df627c138fb31fae9f2992f10942f06e249')

_bzrtrunk=lp:nunitv2
_bzrmod=nunit

build() {
    cd "$srcdir"
    msg "Connecting to Bazaar server...."

    if [[ -d "$_bzrmod" ]]; then
        cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver" && cd "$srcdir"
        msg "The local files are updated."
    else
        bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
    fi

    msg "Bazaar checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$_bzrmod-build"
    cp -r "$_bzrmod" "$_bzrmod-build"
    cd "$_bzrmod-build"

    sed -i 's|NANT="tools/nant-0.90/bin/NAnt.exe"|NANT="tools/nant-0.91/bin/NAnt.exe"|' build

    ./build release mono-2.0
}

package() {
    cd "$srcdir/$_bzrmod-build"

    install -D -m755 $srcdir/nunit.sh $pkgdir/usr/bin/nunit
    install -D -m655  $srcdir/nunit.pc $pkgdir/usr/lib/pkgconfig/nunit.pc

    mkdir -p $pkgdir/usr/lib/$_pkgname/
    cp -r builds/mono/2.0/release/* $pkgdir/usr/lib/$_pkgname/

    mkdir -p $pkgdir/usr/share/doc/$_pkgname/
    cp -r doc/* $pkgdir/usr/share/doc/$_pkgname/

    mkdir -p $pkgdir/usr/share/$_pkgname/
    cp -r samples/ $pkgdir/usr/share/$_pkgname/

    install -D -m655 license.txt $pkgdir/usr/share/licenses/$_pkgname/license.txt
}
