# Maintainer: Manuel Fill <ap0calypse@agitatio.org>
pkgname=bazinga-git
pkgver=20120109
pkgrel=1
pkgdesc="free console driven blogging software like nanoblogger"
arch=('any')
url="http://github.com/ap0calypse/bazinga"
license=('GPL')
depends=('highlight' 'texlive-bin' 'texinfo' 'gnuplot' 'imagemagick' 'ncftp' 'git')
makedepends=('git')
provides=('bazinga')

_gitroot="https://github.com/ap0calypse/bazinga.git"
_gitname="bazinga"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."
    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
    cd "$srcdir/$_gitname-build"
    install -D -m755 bzg "${pkgdir}/usr/local/bin/bzg"
    install -D -m644 examples/example-config "${pkgdir}/usr/share/doc/bazinga/example-config"
    install -D -m644 examples/example-article "${pkgdir}/usr/share/doc/bazinga/example-article"
    install -D -m644 examples/style-improved.css "${pkgdir}/usr/share/doc/bazinga/style-improved.css"
    install -D -m644 examples/index.template "${pkgdir}/usr/share/doc/bazinga/index.template"
    install -D -m644 README "${pkgdir}/usr/share/doc/bazinga/README"
    install -D -m644 AUTHORS "${pkgdir}/usr/share/doc/bazinga/AUTHORS"
    install -D -m644 LICENSE "${pkgdir}/usr/share/doc/bazinga/LICENSE"
} 
