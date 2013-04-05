# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: catalyst <catalyst@xaker.ru>

_pkgname=abiword
pkgname=$_pkgname-svn
pkgver=2.9.4.0.32831
pkgrel=1
pkgdesc="A fully-featured word processor (SVN Version)"
arch=(i686 x86_64)
url=http://www.abisource.com
license=(GPL2)
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
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=(!libtool !makeflags)
install=$_pkgname.install
source=($pkgname::svn+http://svn.abisource.com/abiword/trunk/)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    echo $(grep -o 'assemblyIdentity version=\"[0-9.]\+\"' $pkgname/src/wp/main/win/AbiWord.exe.x86.MANIFEST | tr -d '[a-zA-z= "]').$(svnversion "$SRCDEST"/$pkgname/)
}

build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
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
    make -C $pkgname DESTDIR="$pkgdir" install
}
