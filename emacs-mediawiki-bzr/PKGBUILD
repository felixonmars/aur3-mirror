# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Philanecros Heliostein <philanecros@gmail.com>
pkgname=emacs-mediawiki-bzr  
pkgver=34
pkgrel=3
pkgdesc="Use the power of Emacs to edit MediaWiki sites."
url="http://www.emacswiki.org/emacs/MediaWikiMode"
arch=('any')
license=('GPLv3')
depends=('emacs')
makedepends=('bzr')
provides=('emacs-mediawiki')
conflicts=('emacs-mediawiki')
_bzrtrunk="https://code.launchpad.net/~hexmode/mediawiki-el/trunk"
_bzrmod=${pkgname}

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ] ; then
    cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"
  
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "mediawiki.el"))' || return 1
}

package() {
  cd "$srcdir/$_bzrmod-build"

  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp || return 1
  cp mediawiki.el{,c} ${pkgdir}/usr/share/emacs/site-lisp || return 1
}
