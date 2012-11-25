# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

_pkgname=unicon
pkgname=$_pkgname-svn
pkgver=3303
pkgrel=1
pkgdesc="Unicon is a very high level, goal-directed, object-oriented, general purpose applications language. SVN version"
arch=(i686 x86_64)
url=http://$_pkgname.sourceforge.net
license=(GPL)
conflicts=(icon $_pkgname)
provides=(icon $_pkgname)
options=(!emptydirs)
makedepends=(subversion)
depends=(libgl libiodbc libjpeg-turbo libxext)

_svntrunk=https://$_pkgname.svn.sourceforge.net/svnroot/$_pkgname/trunk
_svnmod=$_pkgname

build() {
    install -d "$srcdir"/$_pkgname/
    cd "$srcdir"/$_pkgname/

    msg "Starting SVN checkout..."
    if [[ -d $_svnmod/.svn ]]; then
        pushd $_svnmod && svn up -r $pkgver
        msg2 "The local files have been updated."
        popd
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
    msg2 "SVN checkout done or server timeout"

    rm -rf $_svnmod-build
    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build

    msg "Compiling..."
    if [[ $CARCH == "x86_64" ]] ; then
        make X-Configure name=x86_64_linux
    else
        make X-Configure name=x86_32_linux
    fi
    make Unicon
    sed -i "s:^\t\tcp doc.*:\t\t# omitted:" Makefile
}

package() {
    cd "$srcdir"/$_pkgname/ $_svnmod-build/
    install -d "$pkgdir"/usr/share/$_pkgname
    make Install dest="$pkgdir"/usr/share/$_pkgname

    install -d "$pkgdir/usr/bin"
    for i in icon{t,x} ivib{,migrate} patchstr udb ui uni{con,dep,doc}; do
        ln -s /usr/share/$pkgname/bin/$i "$pkgdir"/usr/bin/$i
    done
}
