# Maintainer: Padfoot <padfoot at exemail dot com dot au>

pkgname=mttroff-svn
pkgver=6432
pkgrel=1
pkgdesc="Multitouch Tron game."
arch=('any')
url="https://www.libavg.de/site/projects/libavg/wiki/TROff"
license=('GPL3')
depends=('libavg'
         'python2'
         'hicolor-icon-theme')
makedepends=('subversion'
             'gtk-update-icon-cache')
install='mttroff.install'
source=("mttroff.desktop"
        "mttroff.png")
md5sums=('6d4a76e7a98136b76faa3f05465f0330'
         'ba2e101f20b9d7981e776bd3aea206a6')

_svntrunk=https://www.libavg.de/svn/trunk/avg_media/mtc/troff
_svnmod=troff

build() {
    cd "$srcdir"
    msg "Connecting to SVN server..."

    if [[ -d "$_svnmod/.svn" ]]; then
        (cd "$_svnmod" && svn up -r "$pkgver")
    else
        svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
    fi

    msg "SVN checkout done or server timeout"
  
    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    cd "$srcdir/$_svnmod-build"
  
    sed -i "s/python/python2/g" mttroff/*.py
    sed -i "s/python/python2/g" scripts/mttroff
}

package() {
    _python_libs=`python2 -c "from distutils import sysconfig; print sysconfig.get_python_lib()"`
    
    mkdir -p \
        "$pkgdir/usr/bin" \
        "${pkgdir}${_python_libs}" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps" \
        "$pkgdir/usr/share/applications" || return 1

    cd "$srcdir/$_svnmod-build"
    cp -r mttroff "${pkgdir}${_python_libs}"

    cd ./scripts
    install -D -m755 mttroff "$pkgdir/usr/bin"
    
    cd "$srcdir"
    install -D -m755 mttroff.desktop "$pkgdir/usr/share/applications"
    install -D -m644 mttroff.png "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
