# Mantainer: Gianni Vialetto <g.vialetto@gmail.com>
# Contributor: Johannes Weiner <hannes@saeurebad.de>
# Contributor: Daniel Leidisch <spam@leidisch.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=slime-snapshot
pkgver=20120613
_pkgrver=2012-06-13
pkgrel=1
arch=('any') 
pkgdesc="The Superior Lisp Interaction Mode for Emacs"
url="http://common-lisp.net/project/slime/" 
depends=('emacs')
makedepends=('awk' 'texlive-core') 
license=('custom') 
conflicts=('slime')
provides=('slime') 
install='slime-snapshot.install'
# orig: http://common-lisp.net/project/slime/snapshots/slime-current.tgz
source=(slime-snapshot-${pkgver}.tar.gz licenses)
md5sums=('9fbb5437bac4681692b3889d47316151'
         '1cdfb69afc10f0d0b690884591678081')

build() {
  cd $srcdir/slime-${_pkgrver}/doc
  make
}

package() {
  cd $srcdir/slime-${_pkgrver}
  find . -iname "*cvs*" | xargs rm -rf

  install -d $pkgdir/usr/share/emacs/site-lisp/slime/contrib
  install -d $pkgdir/usr/share/common-lisp/systems
  install -d $pkgdir/usr/share/doc/slime/html

  install -m644 *.el *.lisp \
    $pkgdir/usr/share/emacs/site-lisp/slime/
  install -m644 contrib/*.el contrib/*.lisp \
    $pkgdir/usr/share/emacs/site-lisp/slime/contrib/

  ln -s /usr/share/emacs/site-lisp/slime/swank.asd \
    $pkgdir/usr/share/common-lisp/systems/

  install -Dm644 $srcdir/licenses \
    $pkgdir/usr/share/licenses/$pkgname/licenses 

  install -m644 doc/slime.pdf $pkgdir/usr/share/doc/slime/
  install -m644 doc/slime-refcard.pdf $pkgdir/usr/share/doc/slime/
  install -m644 doc/html/* $pkgdir/usr/share/doc/slime/html

  cd doc
  make infodir=$pkgdir/usr/share/info install 
  rm $pkgdir/usr/share/info/dir
}
