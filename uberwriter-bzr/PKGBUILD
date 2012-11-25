# Maintainer: Maximilian Köhl <linuxmaxi@googlemail.com>
pkgname=uberwriter-bzr
pkgver=93
pkgrel=2
pkgdesc="It's a simple Markdown editor that offers a lot of features."
arch=(any)
url="http://uberwriter.wolfvollprecht.de/"
license=('GPL')
depends=('python-gtkspellcheck' 'python-gobject' 'ttf-ubuntu-font-family')
optdepends=('texlive-core: pdf support' 'pandoc: convert markdown to various formats')
makedepends=('python2-distutils-extra' 'bzr')
conflicts=('uberwriter')
provides=('uberwriter')
install=install.sh

source=()
noextract=()

md5sums=()

_bzrtrunk=lp:uberwriter
_bzrmod=uberwriter

build() {
    cd "$srcdir"
    msg "Connecting to Bazaar server...."

    if [[ -d "$_bzrmod" ]]; then
        cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver"
        msg "The local files are updated."
    else
        bzr co "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
    fi

    msg "Bazaar checkout done or server timeout"
    msg "Starting build..."
}

package() {
    cd "$srcdir/$_bzrmod"
    python2 setup.py install --root=${pkgdir}
}
