# Contributor: osily <ly50247@gmail.com>
# Contributor: tassadar <tlatsas2000@gmail.com>

pkgname=sqlitebrowser2
_realname=sqlitebrowser
pkgver=2.0b1
pkgrel=3
pkgdesc="SQLite Database browser is a light GUI editor for SQLite databases, built on top of QT"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sqlitebrowser/"
license=('custom')
depends=('qt')
source=("http://downloads.sourceforge.net/project/sqlitebrowser/sqlitebrowser/2.0%20beta1/sqlitebrowser_200_b1_src.tar.gz")
md5sums=('5ca3d41cca454235b93ce72cd585dfe3')

build() {
    cd ${srcdir}/trunk/${_realname}
    qmake || return 1
    make || return 1
    cd ${_realname}
    install -D -m755 "sqlitebrowser" "${pkgdir}/usr/bin/sqlitebrowser" || return 1
    install -D -m644 LICENSING ${pkgdir}/usr/share/licenses/${_realname}/LICENSE || return 1
}
