# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=emacs-multiple-cursors
pkgname=$_pkgname-git
pkgver=2014.02.17.ga3e6ec7
pkgrel=2
pkgdesc="Multiple cursors for Emacs, dev version"
arch=('any')
url="https://github.com/magnars/multiple-cursors.el"
license=('GPL3')
install=$pkgname.install
maedepends=('git')
depends=()
optdepends=('emacs')
provides=('emacs-multiple-cursors')
conflicts=('emacs-multiple-cursors')
source=("git+http://github.com/magnars/multiple-cursors.el.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/multiple-cursors.el"
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}


build() {
    cd "${srcdir}/multiple-cursors.el"
    emacs --batch --no-site-file -f batch-byte-compile *.el
}

package() {
    cd "$srcdir/multiple-cursors.el"
    install -d -m755 "$pkgdir/usr/share/emacs/site-lisp/multiple-cursors"
    cp -r * "$pkgdir/usr/share/emacs/site-lisp/multiple-cursors"
}
