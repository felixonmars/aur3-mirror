# Contributor: Frank Smit <frank/61924/nl>

pkgname="python-circuits-hg"
pkgver=2715
pkgrel=1
source=()
md5sums=()

url="http://bitbucket.org/prologic/circuits"
pkgdesc="A Lightweight Event driven Framework for the Python Programming Language, with a strong Component Architecture"
license=('MIT')

arch=('x86_64' 'i686')

_hgroot="http://bitbucket.org/prologic"
_hgrepo="circuits"

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

  python setup.py build
  python setup.py install --root="$pkgdir" --prefix=/usr
}
