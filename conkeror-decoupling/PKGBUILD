#Maintainer: aksr <aksr at t-com dot me>

pkgname=conkeror-decoupling
pkgver=20120111
pkgrel=1
pkgdesc="Conkeror Decoupling is an experimental branch of Conkeror."
arch=('any')
url="http://retroj.net/conkeror-decoupling"
license=('MPL' 'GPL2' '(L)GPLv2')
depends=('xulrunner' 'desktop-file-utils')
makedepends=('git')
provides=(conkeror-decoupling)
source=(conkeror-decoupling.sh)
md5sums=('eececdf16275aec2835cd8af8e5aa4d5')

_gitroot="http://retroj.net/git/conkeror-decoupling/.git/"
_gitname="conkeror-decoupling"

build() {
  cd "$srcdir"

 ## Git checkout
  if [ -d "$srcdir"/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin master
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot} && cd ${_gitname}
  fi
  msg "Checkout completed"
}

package() { 
  cd "$srcdir"/${_gitname}

  install -d "$pkgdir"/usr/share/{conkeror-decoupling,man/man1}
  cp -a "$srcdir"/${_gitname}/* "$pkgdir"/usr/share/conkeror-decoupling

  install -Dm644 "$pkgdir"/usr/share/conkeror-decoupling/contrib/man/conkeror.1 \
    "$pkgdir"/usr/share/man/man1/conkeror-decoupling.1
  install -Dm644 "$srcdir"/${_gitname}/debian/conkeror.desktop \
    "$pkgdir"/usr/share/applications/conkeror-decoupling.desktop
  install -Dm755 "$srcdir"/conkeror-decoupling.sh "$pkgdir"/usr/bin/conkeror-decoupling

  rm -r "$pkgdir"/usr/share/conkeror-decoupling/contrib/man
  rm -r "$pkgdir"/usr/share/conkeror-decoupling/debian
}
