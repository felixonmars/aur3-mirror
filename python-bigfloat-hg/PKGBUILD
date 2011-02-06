# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
pkgname=python-bigfloat-hg
pkgver=228
pkgrel=1
pkgdesc="Arbitrary-precision correctly-rounded floating point arithmetic in Python, via the MPFR library."
arch=('any')
url="http://packages.python.org/bigfloat/"
license=('custom')
makedepends=('mercurial')
depends=('python' 'gmp' 'mpfr')
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot="http://bitbucket.org/dickinsm/"
_hgrepo="bigfloat"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #
  python setup.py install \
    --prefix=/usr \
    --root=$pkgdir \
    || return 1

  install -m644 -D "Academic Free License 3.0.html" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

