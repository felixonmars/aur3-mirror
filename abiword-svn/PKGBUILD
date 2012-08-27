# Maintainer: Limao Luo <luolimao@gmail.com>
# Contributor: catalyst <catalyst@xaker.ru>

_pkgname=abiword
pkgname=$_pkgname-svn
pkgver=29400
pkgrel=1
pkgdesc="A fully-featured word processor (SVN Version)"
arch=(i686 x86_64)
url="http://www.abisource.com"
license=(GPL)
depends=(fribidi wv goffice-devel librsvg redland evolution-data-server desktop-file-utils)
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
options=(!makeflags)

_svntrunk=http://svn.abisource.com/abiword/trunk/
_svnmod=abiword

build() {
    msg "Starting SVN checkout..."
    install -d $srcdir/$_pkgname/
    cd $srcdir/$_pkgname/

    if [[ -d $_svnmod/.svn ]]; then
	cd $_svnmod && svn up -r $pkgver
	cd ../
    else
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    msg "SVN checkout done or server timeout"

    msg "Starting make..."
    
    rm -rf $_svnmod-build
    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build

    msg "Compiling"
    
    # does ./autogen.sh exist?
    ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
        --disable-maintainer-mode \
	--disable-static \
        --enable-plugins \
	--enable-clipart \
	--enable-templates \
	--enable-scripting
    _corecount=$(grep -i processor /proc/cpuinfo | wc -l)
    make -j$_corecount
}

package() {
    cd $srcdir/$_pkgname/$_svnmod-build/
    make DESTDIR=$pkgdir install
}
