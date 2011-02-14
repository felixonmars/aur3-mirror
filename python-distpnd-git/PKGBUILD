# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Your Name <youremail@domain.com>
pkgname=python-distpnd-git
pkgver=20110214
pkgrel=1
pkgdesc="distutils commands to create PND files for the Pandora handheld."
arch=('any')
url="https://github.com/Tempel/distPND"
license=('MIT')
depends=('python2')
makedepends=('git')
optdepends=('squashfs-tools: build standard compressed PNDs' 
            'cdrkit: build iso file PNDs')
provides=('python-distpnd')
conflicts=('python-distpnd')
replaces=()
backup=()
options=(!emptydirs)
install=
source=()
md5sums=()

_gitroot="https://github.com/Tempel/distPND.git"
_gitname="distPND"

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --bare $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  git checkout origin/develop

  python2 setup.py install --root=$pkgdir/ --optimize=1

  install -D -m644 "$srcdir/$_gitname-build/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
