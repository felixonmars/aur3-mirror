# Contributor: Anthony Martin <ality@pbrane.org>
# Contributor: Chris Brannon <cmbrannon79 (at) gmail.com>

pkgname='ii-hg'
pkgver=81
pkgrel=1
pkgdesc="A minimalist FIFO and filesystem-based IRC client"
arch=(i686 x86_64)
url="http://wmii.de/index.php/WMII/ii"
license=('MIT')
depends=('glibc')
makedepends=('mercurial')
provides=('ii')
conflicts=('ii')
source=('config.mk')
md5sums=('17d6db42d3297691e4a8e98598065f59')

_hgroot='http://hg.suckless.org/'
_hgrepo='ii'

build() {
    cd "$srcdir"

    rm -rf "$_hgrepo-build"
    if [ ! -d $_hgrepo ]; then
	hg clone $_hgroot$_hgrepo || return 1
    else
	cd $_hgrepo
	hg pull -u
    fi
    cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
    cd "$srcdir/$_hgrepo-build"
    cp ../config.mk .

    sed -i "s|%CFLAGS%|$CFLAGS|g" config.mk
    sed -i "s|%LDFLAGS%|$LDFLAGS|g" config.mk

    make || return 1
    make DESTDIR="$pkgdir" install

    install -m755 -d  "$pkgdir/usr/share/licenses/ii-hg" || return 1
    install -m644 LICENSE "$pkgdir/usr/share/licenses/ii-hg" || return 1
    # make install sets permissions to 775...
    chmod 755 "$pkgdir/usr/bin/ii"
    rm -f "$pkgdir/usr/share/doc/ii/LICENSE" # no duplicate files, please
}
