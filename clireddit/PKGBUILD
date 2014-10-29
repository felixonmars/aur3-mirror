# Maintainer: Theun Voets <munsking (a) gmail , com> 
pkgname=clireddit
pkgver=0.1_01
pkgrel=1
pkgdesc="A command line interface for reddit, using python" 
arch=('any')
url="https://github.com/munsking/cliReddit"
license=('GPL2')
depends=(python-urllib3 python-pyperclip python-termcolor python-requests feh gifsicle) 
makedepends=(git)
_gitroot="https://github.com/munsking/cliReddit.git"
_gitname="cliReddit"
_installedname="clireddit"

build() {
  echo $srcdir
  echo $pkgdir
  echo $_distdir
  cd "$srcdir/$_distdir"
  git clone $_gitroot
}

package() {
  cd "$srcdir/$_distdir"
  if [ ! -d "$pkgdir/usr/bin"  ]; then
    mkdir -p "$pkgdir/usr/bin"
  fi
  
  cp "$srcdir/$_gitname/$_gitname" "$pkgdir/usr/bin/$_installedname"
}
