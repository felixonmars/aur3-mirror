# Contributor: Xavier Del Castillo <xdelcastillo@archlinux.us>
pkgname=emacs-django-mode-git
pkgver=20121220
pkgrel=1
pkgdesc="Django mode and snippets for Emacs"
arch=('any')
url="https://github.com/myfreeweb/django-mode"
license=('GPL')
groups=()
depends=(emacs-yasnippet emacs)
makedepends=('git')
install=$pkgname.install

_gitroot=$url.git

build() {
    msg "Connecting to GIT server..."

    if [[ -d $srcdir/$pkgname-$pkgver ]]; then
	cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
    else
	git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
	cd $srcdir/$pkgname-$pkgver
    fi

    msg "GIT checkout done or server timeout"

    mkdir -p $pkgdir/usr/share/emacs/site-lisp/django-mode
    install -Dm644 *.el $pkgdir/usr/share/emacs/site-lisp/django-mode
    cp -r snippets $pkgdir/usr/share/emacs/site-lisp/django-mode/
}
