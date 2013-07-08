# Maintainer: Chirantan EKbote <chirantan.ekbote at gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=emacs-helm-git
pkgver=1.5.3.3.gadc45ec
pkgrel=1
pkgdesc="Incremental completion and selection narrowing framework for Emacs"
url="https://github.com/emacs-helm/helm"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-helm')
conflicts=('emacs-helm')
install=emacs-helm.install
source=("git://github.com/emacs-helm/helm.git")
md5sums=('SKIP')
changelog=CHANGELOG

pkgver() {
    cd helm
    git describe | sed 's/-/./g;s/v//g'
}

build() {
    make -C helm
}

package() {
    cd helm
    install -d "$pkgdir/usr/share/emacs/site-lisp/helm"
    install -m644 helm* "$pkgdir/usr/share/emacs/site-lisp/helm/"
}
