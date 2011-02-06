# Maintainer: Hubert Star <hubertstar@gmail.com>
# Contributor: Hubert Star <hubertstar@gmail.com>
# Contributor: mutantmonkey <mutantmonkey@gmail.com>

pkgname=pgadmin3-svn
pkgver=8445
pkgrel=1
pkgdesc="A comprehensive design and management interface for PostgreSQL \
    database, svn package."
arch=('i686' 'x86_64')
url="http://www.pgadmin.org"
license=('custom')
depends=('wxgtk' 'postgresql' 'libpqxx')
source=(pgadmin3.desktop)
md5sums=("d07ba4df54baead30b66d19d7450bcad")
_svntrunk="svn://svn.pgadmin.org/trunk/pgadmin3"
_svnmod="pgadmin3"

build() {
    cd $startdir/src

    msg "Checking for previous build"
    rm -rf svnbuild
    
    if [[ -d $_svnmod/.svn ]]; then
        msg "Retrieving updates"
        cd $_svnmod
        svn up || return 1
    else
        msg "Retrieving complete sources"
        svn co $_svntrunk $_svnmod || return 1
        cd $_svnmod
    fi
    
    bash bootstrap
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
 
    install -D -m 644 i18n/pgadmin3.lng $startdir/pkg/usr/share/pgadmin3/i18n
    install -D -m 644 LICENSE $startdir/pkg/usr/share/licenses/pgadmin3/LICENSE
    
    # Create some needed folders
    mkdir -p $startdir/pkg/usr/share/pgadmin3/pixmaps/
    mkdir -p $startdir/pkg/usr/share/applications/

    install -D -m 644 pgadmin/include/images/pgAdmin3.ico $startdir/pkg/usr/share/pgadmin3/pixmaps/pgAdmin3.ico
    install -D -m 644 $startdir/src/pgadmin3.desktop $startdir/pkg/usr/share/applications/
}
