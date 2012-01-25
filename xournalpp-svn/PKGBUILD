# Contributor: Robert Orzanna <orschiro@googlemail.com>
# Contributor: Florian Bruhin <me@the-compiler.org>

pkgname=xournalpp-svn
_realname=xournalpp
pkgver=205
pkgrel=1
pkgdesc="The latest notetaking and sketching application build on the basis of xournal."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xournal/"
license=('GPL')
depends=('libgnomecanvas>=2.30.1' 'ghostscript' 'shared-mime-info' 'poppler-glib>=0.14.0' 'hicolor-icon-theme' 'desktop-file-utils' 'zlib')
makedepends=('subversion' 'intltool')
provides=('xournalpp')
conflicts=('xournal')
source=('http://www.the-compiler.org/downloads/xournalpp.patch')
md5sums=('0082f7eb39630de0ccd2f9b674023c0c')
install=xournal.install

_svntrunk="https://xournal.svn.sourceforge.net/svnroot/xournal/trunk/xournalpp"
_svnmod=xournalpp

build() {
    cd ${srcdir}

    ##########################
    msg "Getting sources..."
    if [ -d ${_svnmod}/.svn ]; then
      cd ${_svnmod} && svn up -r ${pkgver}
    else
      svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
      cd ${_svnmod}
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."
  
    #########################
    cd "${srcdir}/${_realname}"
    patch -p3 < "${srcdir}/xournalpp.patch"
    autoreconf -i
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_realname}"
    make DESTDIR="${pkgdir}" install desktop-install
}
