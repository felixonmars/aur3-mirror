# Maintainer: Keith Hughitt <khughitt@umd.edu>
# Contributor: Ivan Pulido <ijpulidos@riseup.net>
pkgname=python-sunpy-git
pkgver=20140510
pkgrel=1
pkgdesc="Python library for solar physics"
arch=('i686' 'x86_64')
url="http://www.sunpy.org/"
license=('BSD')
depends=('python' 'python-astropy' 'python-numpy' 'python-pandas'
         'python-matplotlib' 'python-scipy' 'python-beautifulsoup4'
         'python-sqlalchemy' 'python-suds-jurko' 'python-glymur')
options=(!emptydirs)

_gitroot=https://github.com/sunpy/sunpy
_gitname=sunpy

package(){
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python setup.py install --root="$pkgdir/" --optimize=1
}

