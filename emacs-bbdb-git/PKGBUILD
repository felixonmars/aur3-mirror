# Maintainer: Ivy Foster <joyfulgirl@archlinux.us>
pkgname=emacs-bbdb-git  
pkgver=20111230
pkgrel=1
pkgdesc="The Insidious Big Brother Database (from git)"
url="http://savannah.nongnu.org/projects/bbdb/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('emacs')
makedepends=('texinfo')
optdepends=('vm: The vm mailer for emacs')
provides=('bbdb=3.0')
conflicts=('bbdb')
install=${pkgname}.install
changelog=ChangeLog
source=()
md5sums=()
options=(!zipman)

_gitroot="git://git.savannah.nongnu.org/bbdb.git"
_gitname="bbdb"

build () {
  cd $srcdir
  msg "Connecting to the git server..."

  if [[ -d $srcdir/$_gitname ]]; then
    cd $_gitname
    git pull origin master
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "git checkout done"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build

  cd $srcdir/$_gitname-build/
  autoconf

  ./configure --prefix=/usr \
              --with-lispdir=/usr/share/emacs/site-lisp/bbdb \
              --with-texmf-dir=/usr/share/texmf/tex/latex
  make all
}

package () {
  cd $srcdir/$_gitname-build/
  sed -i "s:infodir = :&${pkgdir}/:" doc/Makefile
  sed -i -e "s:texmf_dir = :&${pkgdir}/:" \
    -e '/$(INSTALL) -d -m 0755 "$(texmf_dir)/c$(INSTALL) -d -m 0755 "$(texmf_dir)/"; \\' \
    tex/Makefile
  make DESTDIR=${pkgdir} install install-el

  # Some extra documentation
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 -t $pkgdir/usr/share/doc/$pkgname \
    ChangeLog README TODO
  gzip $pkgdir/usr/share/info/bbdb.info
  rm -f $pkgdir/usr/share/info/dir
}
