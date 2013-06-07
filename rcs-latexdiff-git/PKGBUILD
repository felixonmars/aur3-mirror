# Maintainer: Thibaut HOREL <thibaut dot horel at gmail dot com>
_gitname=rcs-latexdiff
pkgname=$_gitname-git
pkgver=11.ce60809
pkgrel=1
pkgdesc="A tool to generate a latexdiff of a file (contained in a RCS like Git, svn, Mercurial, etc.)"
arch=(any)
url="https://github.com/driquet/rcs-latexdiff"
license=('GPL3')
depends=('python2' 'latexdiff')
makedepends=('git')
source=('git+https://github.com/driquet/rcs-latexdiff.git')
md5sums=('SKIP')

pkgver(){
     cd "$srcdir/$_gitname"
      echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
