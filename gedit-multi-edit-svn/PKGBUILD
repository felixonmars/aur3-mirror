# Contributor: Jonas Haag <jonas@lophus.org>

pkgname=gedit-multi-edit-svn
pkgver=20100222
pkgrel=1
pkgdesc="A gedit plugin that allows simulaneous editing of multiple parts of a document"
arch=('x86_64' 'i686')
url="http://jon-walsh.com/journal/multi-edit/"
license=('GPLv3')
depends=('gedit')
makedepends=('subversion')

_svnroot="http://svn.jon-walsh.com/multi-edit/trunk/"
_svnname="multi-edit"

_gedit_dir="${pkgdir}/usr/lib/gedit-2/"
_gedit_plugins_dir="${_gedit_dir}/plugins/"

build() {
    cd "$srcdir"
    msg "Checking out from SVN..."

    if [ -d $_svnname ] ; then
        cd $_svnname && svn up
        msg "The local files are updated."
    else
        svn co $_svnroot $_svnname
    fi

    msg "SVN checkout done or server timeout"

    msg "Starting make..."

    rm -rf "$srcdir/$_svnname-build"
    cp -r "$srcdir/$_svnname" "$srcdir/$_svnname-build"
    cd "$srcdir/$_svnname-build"

    msg "Copying files..."
    mkdir -p $_gedit_plugins_dir
    cp -r multi_edit multi_edit.gedit-plugin $_gedit_plugins_dir || return 1

}

