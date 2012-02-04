# Contributor: m039 <m0391n (at) gmail (dot) com>

pkgname=emacs-xmlrpc
_pkgname=xml-rpc
pkgver=1.6.8
pkgrel=1
pkgdesc="An elisp implementation of clientside XML-RPC"
url="http://www.emacswiki.org/emacs/XmlRpc"
arch=('any')
license=('GPL3')
depends=()
install=$pkgname.install
source=(http://www.emacswiki.org/emacs/download/$_pkgname.el)
md5sums=('03539d4d5b870ec3d0246521cc1bd706')

build() {
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp
  cp $startdir/src/$_pkgname.el $startdir/pkg/usr/share/emacs/site-lisp
}

