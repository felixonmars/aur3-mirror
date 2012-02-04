# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Contributor: Dwight Schauer <dschauer@ti.com>
_pkgname=pylibpci
pkgname=${_pkgname}-git
pkgver=20100621
pkgrel=1
pkgdesc="Python bindings for libpci"
arch=(x86_64 i686)
url="http://wiki.github.com/NicolasT/pylibpci/"
license=('BSD')
groups=()
depends=(libpci)
makedepends=('git' 'cython' 'patch')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
#source=($pkgname-$pkgver.tar.gz)
source=("setup.py.patch" "lspci.py.patch")
noextract=()
#md5sums=() #generate with 'makepkg -g'

md5sums=('273d3cbbe3ea5e40639bc538d7108dae'
         '6a5785d4b46485aea9807278435d9579')

_gitroot="http://github.com/NicolasT/${_pkgname}.git"
_gitname="${_pkgname}"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  #return 1

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch --verbose < ${srcdir}/setup.py.patch setup.py
  #return 1

  python setup.py install --root ${pkgdir}
  (cd $(find ${pkgdir} -type d -name ${_pkgname}) && cp -vp *.so ../)

  patch --verbose < ${srcdir}/lspci.py.patch lspci.py
  install --verbose -d ${pkgdir}/usr/shared/${_pkgname}
  install --verbose lspci.py ${pkgdir}/usr/shared/${_pkgname}
} 
