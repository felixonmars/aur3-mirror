# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=shoebot-hg
pkgver=453
pkgrel=1
pkgdesc="A pure Python graphics robot"
arch=('any')
url="http://shoebot.net/"
license=('GPL')
depends=('pygtk' 'python-imaging' 'pygtksourceview2')
makedepends=('mercurial')
provides=('shoebot')
conflicts=('shoebot')
install="$pkgname.install"

_hgroot="https://code.goto10.org/hg/"
_hgrepo="shoebot"

build() {

  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot$_hgrepo $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

  # Python2 fixes
  export PYTHON="python2"
  sed \
	-e "s_\(env python\).*_\12_" \
	-e "s_\(bin/python\).*_\12_" \
	-i `grep -rlE "(env python|bin/python)" .`

  python2 setup.py install --prefix=/usr --root="$pkgdir/"
} 
