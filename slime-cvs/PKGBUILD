# Contributor: Johannes Weiner <hannes@saeurebad.de>
# Contributor: Daniel Leidisch <spam@leidisch.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=slime-cvs 
pkgver=20131117
pkgrel=1
arch=('any') 
pkgdesc="The Superior Lisp Interaction Mode for Emacs"
url="http://common-lisp.net/project/slime/" 
depends=('emacs')
makedepends=('cvs' 'awk' 'texinfo') 
optdepends=('awk: for recreating the documentation' 
  'texlive-core: for recreating the documentation') 
license=('custom') 
conflicts=('slime')
provides=('slime') 
install='slime.install'
source=(licenses texi.patch)
md5sums=('1cdfb69afc10f0d0b690884591678081'
         '1752ce1c41f6be972a4b2d2f4aa2a176')

_cvsroot=:pserver:anonymous:anonymous@common-lisp.net:/project/slime/cvsroot
_cvsmod=slime

pkgver() {
  cd $srcdir
  if [ -d $_cvsmod/CVS ]; then
    msg2 "Updating existing checkout"
    cd $_cvsmod
    cvs -qz3 update -CdP > /dev/null
  else
    msg2 "Checking out upstream code"
    cvs -qz3 -d$_cvsroot co -P $_cvsmod > /dev/null
    cd $_cvsmod
  fi
  msg2 "Checkout up to date"

  cvs log -bd `date +%Y-%m-%d` ChangeLog | grep ^date | sed 's/date: \([^ ]*\).*/\1/' | sed 's/\///g'|sed 's+-++g'
}

prepare() {
  cd "$srcdir/$_cvsmod/doc"
  sed -i '17d' slime.texi
  sed -i '370,373d' slime.texi
  sed -i '531s+x++' slime.texi
}

package() {
  cd "$srcdir/$_cvsmod"
  install -d $pkgdir/usr/share/emacs/site-lisp/slime
  cp -r $srcdir/slime/* \
    $pkgdir/usr/share/emacs/site-lisp/slime
  
  install -d $pkgdir/usr/share/common-lisp/systems
  ln -s /usr/share/emacs/site-lisp/slime/swank.asd \
    $pkgdir/usr/share/common-lisp/systems/
  
  install -D -m644 $srcdir/licenses \
    $pkgdir/usr/share/licenses/$pkgname/licenses 
  cd doc
  make infodir=$pkgdir/usr/share/info install 
  rm $pkgdir/usr/share/info/dir
  install -Dm644 slime-refcard.pdf \
    $pkgdir/usr/share/doc/slime/slime-refcard.pdf 
}
