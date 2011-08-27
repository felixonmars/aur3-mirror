# Archlive <http://archlive-pkg.googlecode.com>

pkgname=remmina-svn
pkgver=225
pkgrel=1
pkgdesc="Remmina is a remote desktop client written in GTK+. "
#"Remmina supports multiple network protocols in an integrated and consistant user interface. Currently RDP, VNC, XDMCP and SSH are supported."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/remmina/"
license=('GPL')
source=()
provides=(grdc "grdc=0.8" "remmina=0.8")
conflicts=(grdc remmina)
depends=(gtk2 zlib libjpeg avahi vte libssh libgcrypt libunique)
makedepends=(intltool pkgconfig gettext libssh avahi vte libgcrypt libxdmcp)
optdepends=()
install=remmina.install

_svntrunk="https://remmina.svn.sourceforge.net/svnroot/remmina/trunk/remmina"
_svnmod="remmina"

build() {

    cd $srcdir
    
    msg "Updating SVN entries for $_svnmod ..."
    
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    
    [ -d $srcdir/$_svnmod-build ] && rm -rf $srcdir/$_svnmod-build
    cp -r $_svnmod $srcdir/$_svnmod-build
    
    cd $srcdir/$_svnmod-build
    ./autogen.sh
    ./configure --prefix=/usr --enable-nls \
	--enable-avahi --enable-vte --enable-unique \
	--enable-vnc --enable-ssh --enable-gcrypt || return 1
    make || return 1
    make DESTDIR=${pkgdir} install
}
