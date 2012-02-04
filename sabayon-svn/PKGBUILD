# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=sabayon-svn
pkgver=1098
pkgrel=1
pkgdesc="System administration tool to manage GNOME desktop settings"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/sabayon/"
license=('GPL')
depends=('libxml2' 'gnome-python' 'python-ldap' 'pyxdg')
makedepends=('intltool' 'subversion' 'gnome-common')
provides=('sabayon')
conflicts=('sabayon')
options=('!libtool')
install=sabayon.install
source=()
md5sums=()

_svntrunk=svn://svn.gnome.org/svn/sabayon/trunk/
_svnmod=sabayon

build() {
    # Checkout version $pkgver or update to the latest
    cd $srcdir

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    # To preserve the integrity of the original files,
    # we copy all files into a temporary build directory
    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build

    # Configure magic
    ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var/lib/sabayon \
                 --mandir=/usr/share/man --with-distro=slackware
   
    # Fix .desktop
    sed -i 's/Exec=/Exec=gksu /' admin-tool/sabayon.desktop.in.in
    sed -i 's/Exec=/Exec=gksu /' admin-tool/sabayon.desktop.in
    sed -i 's/Exec=/Exec=gksu /' admin-tool/sabayon.desktop

    # Compile and install
    make || return 1
    make DESTDIR=$pkgdir install || return 1

    # Clean build directory
    rm -rf $srcdir/$_svnmod-build
}
