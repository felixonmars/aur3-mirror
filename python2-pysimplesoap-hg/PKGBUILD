pkgname=python2-pysimplesoap-hg
pkgver=1
#pkgver() {
#  cd "$srcdir/$_hgrepo"
#  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
#}
pkgrel=1
pkgdesc="Python Simple SOAP library for client and server webservices interfaces, aimed to be as small and easy as possible, supporting most common functionality."
arch=('any')
url="https://code.google.com/p/pysimplesoap"
license=('LGPL')
groups=()
depends=('python2')
makedepends=('mercurial')
provides=('python2-pysimplesoap')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_hgroot=https://pysimplesoap.googlecode.com/hg/
_hgrepo=pysimplesoap

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #
  python2 setup.py build
}

package() {
  cd "$srcdir/$_hgrepo-build"
  python2 setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}


# vim:set ts=2 sw=2 et:
