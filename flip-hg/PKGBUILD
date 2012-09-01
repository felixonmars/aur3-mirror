pkgname=flip-hg
pkgver=0.1
pkgrel=1
pkgdesc="flip is a templating language for Python2. It was developed to use with latex."
arch=('i686' 'x86_64')
url="https://bitbucket.org/citrux/flip"
license=('MIT')
depends=('python2' 'python2-matplotlib')
makedepends=('mercurial')

_hgroot="https://bitbucket.org/citrux/flip"
_hgname="flip"

build() {
  cd "$srcdir"
  msg "Connecting to mercurial server"
  if [ -d $_hgname ] ; then
    cd "$_hgname" && hg pull
    msg "Local files are updated"
  else
    hg clone "$_hgroot"
  fi
  msg "Mercurial checkout done or server timeout"
  cd "$srcdir"
  cp -r "$_hgname" "$_hgname-build"
  msg2 "Building..."
  cd "$_hgname-build"
  python2 setup.py build
}

package() {
  msg2 "Packaging..."
  cd "$_hgname-build"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
