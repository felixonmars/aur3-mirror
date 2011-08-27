
# Contributor: Paolo Herms
pkgname=coq-8.3-svn
pkgver=13465
pkgrel=1
pkgdesc="The 8.3 branch of coq."
arch=('i686' 'x86_64')
url="http://coq.inria.fr/"
license=('GPL')
depends=('gtk2')
makedepends=('subversion' 'ocaml' 'lablgtk2' 'camlp5-transitional' 'netpbm' 'hevea')
provides=('coq')
conflicts=('coq')

_svntrunk=svn://scm.gforge.inria.fr/svn/coq/branches/v8.3
_svnmod=coq-8.3-svn

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
      cd $_svnmod && svn up -r $pkgver || return 1
  else
      svn co $_svntrunk --config-dir ./ -r $pkgver  $_svnmod && cd $_svnmod || return 1
  fi

  msg "SVN checkout/update done"

  # this avoids to rebuild everything on small updates
  [[ -e "$srcdir"/NOCONFIGURE ]] && msg "Skipping configure - remove src/NOCONFIGURE to force it" || { 
      make clean &&
      ./configure -prefix '/usr' -mandir '/usr/share/man' -opt -coqide opt -with-doc no &&
      echo "Remove this file to force ./configure" > "$srcdir"/NOCONFIGURE ||
      return 1
  }
  
  msg "Starting make..."
  make world && make COQINSTALLPREFIX="${pkgdir}" install || return 1
  make doc-html && make COQINSTALLPREFIX="${pkgdir}" install-doc-html || return 1
  echo $pkgver > "$srcdir"/CURRENT_VERSION
}
