# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Collin Doering <collin@RekahSoft>
pkgname=emacs-google-contacts
pkgver=20120531
pkgrel=1
_gitname="google-contact.el"
_gitbranch="master"
_gitroot="git://git.naquadah.org/google-contacts.el.git"
pkgdesc="A google-contact extension for emacs (version > 24) by Julien Danjou"
url="http://julien.danjou.info/software/google-contacts.el"
arch=('any')
license=('GPL')
depends=('emacs')
makedepends=()
conflicts=()
replaces=()
backup=()
install=$pkgname.install

build() {
  cd ${srcdir}
  if [[ -d $_gitname ]]; then
    cd $_gitname
    msg "Sanitizing work tree"
#    git checkout $_gitbranch
#    git clean -dxf
#    git reset --hard
    msg "Pulling from official repo $_gitroot"
#    git pull origin
  else
    git clone --depth 1 $_gitroot $_gitname
    cd $_gitname
  fi
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/"
  for i in *; do
    install -D -m644 "$i" "${pkgdir}/usr/share/emacs/site-lisp/$i"
  done
}
