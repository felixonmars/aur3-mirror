# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from bazaar sources.

# Contributor: Alexandre Défossez <alexandre.defossez at google famous mailing service>
pkgname=pydoctor-bzr
pkgver=568
pkgrel=1
pkgdesc="An epydoc-like tool"
arch=('any') # python
url="http://codespeak.net/~mwh/pydoctor/"
license=('custom')
groups=()
depends=('python2' 'nevow' 'twisted' 'zope-interface')
makedepends=('bzr')
provides=(pydoctor) 
conflicts=(pydoctor)
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_bzrtrunk="lp:pydoctor"
_bzrmod="pydoctor"

build() {
  cd "$srcdir"
  msg "Connecting to Launchpad server...."

  if [ -d $_bzrmod ] ; then
    cd $_bzrmod
    bzr merge || return 1
    msg "The local files are updated."
  else
    bzr branch "$_bzrtrunk" || return 1
  fi

  msg "Bazaar checkout done or server timeout"

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  python2 setup.py build || return 1
} 

package(){
  cd "$srcdir/$_bzrmod-build"
  python2 setup.py install --root="$pkgdir" || return 1
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
