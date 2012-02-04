# Contributor: zhuqin <zhuqin83@gmail.com>
# Maintainer: M Rawash <mrawash@gmail.com>

pkgname=circular-application-menu-svn
pkgver=54
pkgrel=1
pkgdesc="An experimental pie menu for GNOME."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnome-menus' 'gnome-vfs')
makedepends=('subversion')
url="http://code.google.com/p/circular-application-menu/"

_svntrunk=http://circular-application-menu.googlecode.com/svn/trunk/
_svnmod=circular-application-menu

build() {
    cd $srcdir
    
    if [ -d $_svnmod/.svn ]; then
    svn up -r $pkgver $_svnmod
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    
    msg "SVN checkout done or server timeout"
    msg "Starting make..."
    
    rm -rf $_svnmod-build
    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build

    make INCLUDES='/usr/include/gnome-vfs-2.0' CC='gcc /usr/lib/libgnomevfs-2.so' || return 1

    #create package
    mkdir -p $pkgdir/usr/bin
    install -Dm755 $srcdir/$_svnmod-build/circular-main-menu $pkgdir/usr/bin/ || return 1
}
