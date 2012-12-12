# Maintainer: Renan Birck <renan.ee.ufsm at Google's mail service>

pkgname=pyevolve-git
pkgver=20121212
pkgrel=1
pkgdesc="A Python framework for genetic algorithms."
arch=('any')
url="http://pyevolve.sourceforge.net/"
license=('custom open-source')
depends=('python2' 'python2-pysqlite')
optdepends=('matplotlib: Plotting support for pyevolve_graph.py')
_gitroot="git://github.com/perone/Pyevolve.git"
_gitname="pyevolve"

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  msg "Starting make..."
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
