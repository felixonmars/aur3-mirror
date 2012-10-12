# Contributor: Julian Knauer <jpk@goatpr0n.de>
pkgname=mbpurple-svn
pkgver=387
pkgrel=1
pkgdesc="Libpurple (Pidgin) plug-in supporting microblog services like Twitter"
arch=("i686 x86_64")
url="http://code.google.com/p/microblog-purple/"
license=("GPL3")
depends=("pidgin")
makedepends=("subversion")
provides=("mbpurple")

_svntrunk=http://microblog-purple.googlecode.com/svn/trunk/
_svnmod=microblog-purple-read-only

PURPLE_PLUGIN_DIR=/usr/lib/pidgin
PURPLE_PIXMAP_DIR=/usr/share/pixmaps/pidgin

build() {
    cd "$srcdir"
    
    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    cd "$srcdir/$_svnmod-build"

    make || return 1
    install -m 0755 -d ${pkgdir}/${PURPLE_PLUGIN_DIR}
    install -m 0755 twitgin/twitgin.so ${pkgdir}/${PURPLE_PLUGIN_DIR}/twitgin.so
    install -m 0755 microblog/liboldtwitter.so ${pkgdir}/${PURPLE_PLUGIN_DIR}/liboldtwitter.so
    
    install -m 0755 microblog/libstatusnet.so ${pkgdir}/${PURPLE_PLUGIN_DIR}
    install -m 0755 microblog/libidentica.so ${pkgdir}/${PURPLE_PLUGIN_DIR}
    install -m 0755 microblog/libtwitter.so ${pkgdir}/${PURPLE_PLUGIN_DIR}
    for proto in identica twitter statusnet; do
        install -m 0755 microblog/lib${proto}.so ${pkgdir}/${PURPLE_PLUGIN_DIR}/lib${proto}.so
        for dir in 16 22 48; do
            if [ ! -d ${pkgdir}/${PURPLE_PIXMAP_DIR}/$dir ]; then
                install -m 0755 -d ${pkgdir}/${PURPLE_PIXMAP_DIR}/$dir
            fi
            install -m 0644 microblog/${proto}${dir}.png ${pkgdir}/${PURPLE_PIXMAP_DIR}/$dir
        done
    done
}

