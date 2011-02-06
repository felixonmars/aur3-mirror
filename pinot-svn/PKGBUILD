# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>

pkgname=pinot-svn
pkgver=1561
pkgrel=1
pkgdesc="Personal search and metasearch tool - Development version"
arch=('i686' 'x86_64')
url="http://pinot.berlios.de/"
license=('GPL')
depends=('gtkmm' 'xapian-core' 'libtextcat' 'sqlite3' 'libxml++2' 'curl' 'gmime'
         'dbus-glib' 'shared-mime-info' 'libexif' 'taglib' 'hicolor-icon-theme')
makedepends=('boost' 'desktop-file-utils' 'svn')
optdepends=('unzip: ZIP files extraction'
            'poppler: PDF to text conversion'
            'catdvi: DVI to text conversion'
            'djvulibre: DjVu text extraction'
            'unrtf: RTF to HTML conversion'
            'antiword: MS Word to text conversion'
            'catdoc: XLS and PPT to text conversion'
            'deskbar-applet: Pinot Deskbar-Applet module')
install=pinot.install
replaces=('pinot')
conflicts=('pinot')
provides=('pinot-git=$pkgver' 'pinot')

_svnmod="pinot"
_svntrunk="http://svn.berlios.de/svnroot/repos/pinot/trunk"

build() {
    cd $startdir/src/
    mkdir -p ~/.subversion; touch ~/.subversion/servers

    msg "Connecting to the SVN server...."

    svn co $_svntrunk $_svnmod -r $pkgver 

    [ -d ./$_svnmod-build ] && rm -fr ./$_svnmod-build
    cp -r ./$_svnmod ./$_svnmod-build
    cd ./$_svnmod-build

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

  ./autogen.sh --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

 }
