# Maintainer: Daniel Leining <daniel@the-beach.co>
pkgname=python2-gtkspellcheck-git
pkgver=20120817
pkgrel=1
pkgdesc="A simple but quite powerful spellchecking library written in pure Python for Gtk based on Enchant."
arch=(any)
url="http://koehlma.github.com/projects/pygtkspellcheck.html"
license=('GPL')
depends=('python2-pyenchant')
makedepends=('python2-sphinx' 'git')
optdepends=('gtk3: gtk 3 bindings'
            'gtk2: gtk 2 bindings'
            'pygtk: gtk 2 pygtk bindings'
            'python2-gobject: gtk 2 and 3 gi bindings')
provides=('python2-pylocales' 'python2-gtkspellcheck')
conflicts=('python2-gtkspellcheck')
source=()
md5sums=()

_gitroot=git://github.com/koehlma/pygtkspellcheck.git
_gitname=pygtkspellcheck

build() {
    cd "$srcdir"
    msg "Connecting to GIT server..."
    if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    else
    git clone --depth=1 $_gitroot $_gitname
    fi
    msg "GIT checkout done or server timeout"

    cd $srcdir/$_gitname
    python2 setup.py install --root=${pkgdir}
}

