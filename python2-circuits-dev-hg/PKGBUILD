# Contributor: Nico Suarez <frank/61924/nl>
# based on a PKGBUILD by Frank Smit

pkgname="python2-circuits-dev-hg"
pkgver=3157
pkgrel=1
source=()
md5sums=()

url="http://bitbucket.org/prologic/circuits-dev"
pkgdesc="A Lightweight Event driven Framework for the Python Programming Language, with a strong Component Architecture"
license=('MIT')

arch=('x86_64' 'i686')

_hgroot="http://bitbucket.org/prologic"
_hgrepo="circuits-dev"

depends=('python')
optdepends=('python-greenlet: write semi-synchronous code in your event handlers with waitEvent and callEvent')
makedepends=('mercurial')
conflicts=('python2-circuits-hg')

build () {
  cd $srcdir
  msg "Connecting to Mercurial server..."
  if [[ -d "${_hgrepo}/.hg" ]]; then
    ( cd $_hgrepo && hg pull -u )
  else
    hg clone "${_hgroot}/${_hgrepo}"
  fi
  cd "${_hgrepo}"

  python2 setup.py build
  python2 setup.py install --root="$pkgdir" --prefix=/usr
}
