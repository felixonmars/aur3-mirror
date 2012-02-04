# Maintainer: Yngve Inntjore Levinsen <yngve.inntjore.levinsen@cern.ch>

pkgname=kbibtex-kde4
pkgver=0.3
pkgrel=1
pkgdesc="A BibTeX editor for KDE to edit bibliographies used with LaTeX."
url="http://home.gna.org/kbibtex/"
license=('GPL')
depends=('poppler-qt' 'kdebase-runtime>=4.2.0')
optdepends=('bibtex2html: to convert bibtex files to html files' 'libxslt: Required to transform
XML files' 'libxml2: Required to transform XML files')
makedepends=('subversion' 'cmake' 'automoc4' 'patch')
source=('changes.diff' kbibtex-kde4.install)
arch=('i686' 'x86_64')

md5sums=('b0f4a2e43b4fcdab472aa4f1cbd56ea8'
         'a569538a98b46554c25ec37e321b8ea9')


  _svntag=svn://svn.gna.org/svn/kbibtex/tags/${pkgver}
  _svnmod=kbibtex

build() {
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up)
    else
      svn co $_svntag --config-dir ./ $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    if [ -d "$srcdir/$_svnmod-build" ]; then
        rm -rf "$srcdir/$_svnmod-build"
    fi
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    cd "$srcdir/$_svnmod-build"
    
    msg "Applying patches"
    patch -Np0 -i ../changes.diff
    
    install_prefix=`kde4-config --prefix`
    cmake -DCMAKE_INSTALL_PREFIX="${install_prefix}" -DBINARY_POSTFIX=-kde4 .

    make || return 1
}
  
package() {
    cd ${srcdir}/kbibtex-build
    make DESTDIR=${pkgdir} install || return 1
}
