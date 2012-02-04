# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=go-hdf5-hg
_goname=hdf5
pkgver=9
pkgrel=1
pkgdesc="Go bindings to the HDF5 library"
arch=('i686' 'x86_64')
url="https://bitbucket.org/binet/go-hdf5"
license=('custom')
depends=('go' 'hdf5')
makedepends=('mercurial' 'godag')
provides=('go-hdf5')
options=('!strip')
source=('Makefile')
md5sums=('40fcfbb61d9ae43054d96bc77e159ade')

_hgroot="https://bitbucket.org/binet"
_hgrepo="go-hdf5"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  source /etc/profile.d/go.sh
  cd pkg/hdf5
  cp $srcdir/Makefile .
  gomake
}

package() {
  cd "$srcdir/$_hgrepo-build"
  source /etc/profile.d/go.sh
  mkdir -p ${pkgdir}/${GOROOT}/src/pkg/${_goname}
  # copy source files
  cp -Rv ${srcdir}/${_hgrepo}/* ${pkgdir}/${GOROOT}/src/pkg/${_goname}
  # install libraries
  cd pkg/hdf5
  cp -v ${GOROOT}/src/Make.* ${pkgdir}/${GOROOT}/src/
  GOROOT=${pkgdir}/${GOROOT} gomake install
  rm -f ${pkgdir}/${GOROOT}/src/Make.*
}

# vim: set ts=2 sw=2 et:
