# Contributor: Alexey Vasiliev <robbinton@gmail.com>

pkgname=remmina-gnome-svn
pkgver=199
pkgrel=1
pkgdesc="Gnome panel applet for remmina."
#"Remmina supports multiple network protocols in an integrated and consistant user interface. Currently RDP, VNC, XDMCP and SSH are supported."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/remmina/"
license=('GPL')
source=()
provides=()
conflicts=(remmina-gnome)
depends=("remmina-svn>=$pkgver" gnome-panel)
makedepends=(intltool pkgconfig gettext perl avahi)
install=remmina-gnome.install

_svntrunk="https://remmina.svn.sourceforge.net/svnroot/remmina/trunk/remmina-gnome"
_svnmod="remmina-gnome"

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
    ./configure --prefix=/usr enable-avahi || return 1
    make || return 1
    make DESTDIR=${pkgdir} install
}
