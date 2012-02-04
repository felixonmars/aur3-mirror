# Maintainer: cuihao <cuihao.leo@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>
# Contributor: Jan Willemson <janwil@hot.ee>
# Contributor: Hugo Ideler <hugoideler@dse.nl>
# Contributor: Kandu <1123monkey+arch@gmail.com>
# Original PKGBUILD: Andre Naumann <anaumann@SPARCed.org>
# See http://bbs.archlinux.org/viewtopic.php?t=9318&highlight=fpc

pkgbase=fpc-bugfixes-svn
pkgname=fpc-bugfixes-svn
true && pkgname=('fpc-bugfixes-svn-src' 'fpc-bugfixes-svn')
pkgver=965
_pkgver=2.6.1
pkgrel=1
pkgdesc='The Free Pascal Compiler is a Turbo Pascal 7.0 and Delphi compatible 32bit Pascal Compiler. It comes with fully TP 7.0 compatible run-time library. This is the latest version of the fixes branch. Source package included.'
arch=('i686' 'x86_64')
url="http://www.freepascal.org/"
license=('GPL' 'LGPL' 'custom')
makedepends=(fpc)

_svntrunk=http://svn.freepascal.org/svn/fpcbuild/branches/fixes_2_6/
_svnmod=fpcbuild

build() {
    cd $srcdir

    msg "Connecting to SVN server..."
    if [[ -d $_svnmod/.svn ]]; then
        (cd $_svnmod && svn up)
    else
        svn co "$_svntrunk" --config-dir ./ -r $pkgver ${_svnmod}
    fi

    msg "SVN checkout done or server timeout"

    rm -rf "${_svnmod}-build"
    cp -r $_svnmod "${_svnmod}-build"
}

package_fpc-bugfixes-svn-src() {
    provides=(fpc-src=$_pkgver)
    conflicts=(fpc-src)
    options=('!strip')

    mkdir -p "$pkgdir/usr/lib/fpc/src"
    cp -R "$srcdir/${_svnmod}/fpcsrc" "$pkgdir/usr/lib/fpc/src"
    find "$pkgdir/usr/lib/fpc/src" -type d -name .svn
    find "$pkgdir/usr/lib/fpc/src" -type d -name .svn | xargs rm -rf
}

package_fpc-bugfixes-svn() {
    depends=(ncurses)
    provides=(fpc=$_pkgver)
    conflicts=(fpc)
    backup=("etc/fpc.cfg")
    options=(zipman)

    cd "$srcdir/${_svnmod}-build"
    msg "Starting make..."

    make NOGDB=1 build || return 1
    make NOGDB=1 PREFIX=${pkgdir}/usr install || return 1
    
    # install package license
    install -m 755 -d $pkgdir/usr/share/licenses/$pkgbase
    install -m 644 fpcsrc/rtl/COPYING.FPC $pkgdir/usr/share/licenses/$pkgname/
    
    # create symlink for compiler
    [ "$CARCH" = "i686" ] && ln -s /usr/lib/fpc/$_pkgver/ppc386 $pkgdir/usr/bin/
    [ "$CARCH" = "x86_64" ] && ln -s /usr/lib/fpc/$_pkgver/ppcx64 $pkgdir/usr/bin/
    
    # install sample config file
    mkdir -p $pkgdir/etc
    HOME="/dev/null" $pkgdir/usr/lib/fpc/$_pkgver/samplecfg /usr/lib/fpc/$_pkgver $pkgdir/etc

    mv $pkgdir/usr/man $pkgdir/usr/share/
}


