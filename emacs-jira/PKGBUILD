# Contributor: m039 <m0391n (at) gmail (dot) com>

pkgname=emacs-jira
_pkgname=jira
pkgver=0.3.3
pkgrel=1
pkgdesc="Connect to JIRA issue tracking software"
url="http://www.emacswiki.org/emacs/JiraMode"
arch=('any')
license=('GPL2')
depends=(emacs-xmlrpc)
install=$pkgname.install
source=(http://www.emacswiki.org/emacs/download/$_pkgname.el)
md5sums=('f3c437313a178e6bbd3e3c9eb6bd993a')

build() {
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp
  cp $startdir/src/$_pkgname.el $startdir/pkg/usr/share/emacs/site-lisp
}
