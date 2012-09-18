# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: catalyst <catalyst@xaker.ru>

_pkgname=abiword
pkgname=$_pkgname-svn
pkgver=31916
pkgrel=1
pkgdesc="A fully-featured word processor (SVN Version)"
arch=(i686 x86_64)
url=http://www.abisource.com
license=(GPL)
depends=(fribidi wv goffice-devel redland evolution-data-server desktop-file-utils)
makedepends=(boost libwpg libwps telepathy-glib loudmouth asio
    psiconv gtkmathview libwmf link-grammar aiksaurus libots subversion)
optdepends=('libwpg: wordperfect, wpg plugin'
    'libwps: wordperfect plugin'
    'telepathy-glib: collab plugin'
    'loudmouth: collab plugin'
    'asio: collab plugin'
    'psiconv: psiconv plugin'
    'gtkmathview: mathview plugin'
    'libwmf: wmf plugin'
    'link-grammar: grammar plugin'
    'aiksaurus: aiksaurus plugin'
    'libots: ots plugin')
provides=($_pkgname)
conflicts=($_pkgname)
options=(!makeflags !libtool)
install=$_pkgname.install

_svntrunk=http://svn.abisource.com/abiword/trunk/
_svnmod=$_pkgname

build() {
    install -d "$srcdir"/$_pkgname/
    cd "$srcdir"/$_pkgname/

    msg "Starting SVN checkout..."
    if [[ -d $_svnmod/.svn ]]; then
        pushd $_svnmod && svn up -r $pkgver
        msg "The local files have been updated."
        popd
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    msg "SVN checkout done or server timeout"

    rm -rf $_svnmod-build/
    cp -r $_svnmod/ $_svnmod-build/
    cd $_svnmod-build/

    msg "Compiling..."
    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-maintainer-mode \
        --disable-static \
        --enable-plugins \
        --enable-clipart \
        --enable-templates \
        --enable-scripting
    make
}

package() {
    cd "$srcdir"/$_pkgname/$_svnmod-build/
    make DESTDIR="$pkgdir" install
}
