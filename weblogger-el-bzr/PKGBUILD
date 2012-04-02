# Maintainer: Krzysztof Bezrak <pikpoczek12@gmail.com>
pkgname=weblogger-el-bzr
pkgver=38
pkgrel=1
pkgdesc="A weblog client for emacs"
arch=(any)
url="https://launchpad.net/weblogger-el"
license=('GPL')
depends=('emacs' 'emacs-xmlrpc')
makedepends=('bzr')
conflicts=('weblogger-cvs')
install=weblogger.install

_bzrtrunk=lp:weblogger-el
_bzrmod=weblogger-eo

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."
  
}

package() {
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/weblogger
  cd $srcdir/weblogger-eo
  cp *.el $pkgdir/usr/share/emacs/site-lisp/weblogger
}

# vim:set ts=2 sw=2 et:
