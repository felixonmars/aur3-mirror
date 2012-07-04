# Maintainer: Padfoot <padfoot at exemail dot com dot au>

pkgname=sponc-svn
pkgver=6822
pkgrel=2
pkgdesc="Multitouch Pong game."
arch=('any')
url="http://www.sponc.de"
license=('GPL3')
depends=('libavg'
         'python2'
         'hicolor-icon-theme')
optdepends=('scsynth: Required for in-game audio')
makedepends=('subversion'
             'gtk-update-icon-cache')
install='sponc.install'
source=("sponc.desktop")
md5sums=('92ecb013110c556b1b126c28b90b901e')

_svntrunk=https://www.libavg.de/svn/trunk/avg_media/mtc/sponc
_svnmod=sponc

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
    
    sed -i "s/python/python2/g" scripts/sponc
    sed -i "s/python/python2/g" sponc/*.py
    cp *.sh sponc
}

package() {
    _python_libs=`python2 -c "from distutils import sysconfig; print sysconfig.get_python_lib()"`
    
    mkdir -p \
        "$pkgdir/usr/bin" \
        "${pkgdir}${_python_libs}" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps" \
        "$pkgdir/usr/share/applications" || return 1

    cd "$srcdir/$_svnmod-build"
    cp -r sponc "${pkgdir}${_python_libs}"
    cp sponc/media/finger.png "$pkgdir/usr/share/icons/hicolor/scalable/apps/sponc.png"
    
    cd ./scripts
    install -D -m755 sponc "$pkgdir/usr/bin"
    
    cd "$srcdir"
    install -D -m755 sponc.desktop "$pkgdir/usr/share/applications"
}
