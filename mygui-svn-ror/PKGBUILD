# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: palkeo <palkeo@gmail.com>

pkgname=mygui-svn-ror
pkgver=1
pkgrel=1
pkgdesc="Fast and simple OGRE GUI (specific SVN version for rigsofrods)"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/my-gui/"
license=('GPL')
depends=('freetype2' 'ogre' 'ois')
conflicts=('mygui' 'mygui-svn')
makedepends=('svn')
source=()
md5sums=()

_svntrunk='https://my-gui.svn.sourceforge.net/svnroot/my-gui/trunk'
_svnmod='mygui'

build() {
    cd "${srcdir}"

    if [ -d "${_svnmod}/.svn" ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r 4344 $_svnmod   # check out correct version for RoR
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    mkdir -p "${srcdir}/${_svnmod}-build/build"
    cd "${_svnmod}-build/build"

    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DMYGUI_BUILD_DEMOS=OFF -DMYGUI_BUILD_TOOLS=OFF
    make
}

package() {
    cd "${srcdir}/${_svnmod}-build/build"

    make DESTDIR=${pkgdir} install
}


#category: lib
# vim:set ts=2 sw=2 et:
