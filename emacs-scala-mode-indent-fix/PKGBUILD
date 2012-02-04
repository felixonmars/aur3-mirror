# Contributor: Jeff Simpson <fooblahblah@gmail.com>
pkgname=emacs-scala-mode-indent-fix
pkgver=0.1
pkgrel=3
pkgdesc="Scala mode for emacs with block indent fix"
arch=('any')
url="http://www.scala-lang.org"
license=('GPL')
depends=('emacs')
makedepends=('make')
md5sums=('080412beb9d2e5d9df342a7da60bf99c')
install=emacs_scala_mode.install

_gitname='scala-mode'

build() {
    cd ${srcdir}
    if [ -d $_gitname ]; then
        cd $_gitname
        msg "Updating local files"
        git pull . master
    else
        msg "Cloning git repository"
        git clone git://github.com/fooblahblah/scala-mode.git
    fi
    cd ${srcdir}/${_gitname}

    make || return 1

    mkdir -p ${pkgdir}/usr/share/emacs/scala-mode
    install -m0644 *.elc ${pkgdir}/usr/share/emacs/scala-mode/ || return 1
}
