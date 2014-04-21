pkgname=rml-mmc-svn
pkgver=20120807
pkgrel=3
pkgdesc="Relational Meta Language and the Meta Modelica Compiler"
arch=('i686' 'x86_64')
url="http://www.ida.liu.se/labs/pelab/rml/"
license=('custom:OSMC')
depends=('smlnj>=110.57' 'sh')
makedepends=('subversion')

options=('staticlibs')

_svndir="trunk"
_svnurl="https://openmodelica.org/svn/MetaModelica/$_svndir"

pkgver() {
   cd "${SRCDEST}/${_svndir}"
   svnversion
}

build() {
    cd "$srcdir"
    if [ -d $_svndir/.svn ]; then
        cd $_svndir
        svn --username anonymous --password none --no-auth-cache up
    else
        svn --username anonymous --password none --no-auth-cache co $_svnurl
    fi
    cd "$srcdir/$_svndir"
    source /etc/profile.d/smlnj.sh
#    ./configure --prefix=/opt/rml-mmc --enable-debug --enable-profile
    ./configure --prefix=/usr
    make all-subdirs
}

package() {
    cd $srcdir/$_svndir
    make DESTDIR="$pkgdir" INSTALL_INCLUDE="${pkgdir}" install
    install -Dm 644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # MLton-specific stuff.
    #cd compiler
    #mlton -verbose 3 -target self rml.mlb
    #install -D -m755 rml  "${pkgdir}/opt/rml/bin/rml"
}


