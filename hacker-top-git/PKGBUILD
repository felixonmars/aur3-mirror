# Maintainer: David Manouchehri <david@davidmanouchehri.com>
# Contributor: Nicolas Paris <nicolas.caen@gmail.com>

pkgname=hacker-top-git
_gitname=$(printf ${pkgname%%-git})
_gitbranch=master
_gitauthor=pkrumins
pkgver=r26.ea99ac9
pkgrel=1
pkgdesc="It's a top-like program for monitoring stories on hacker news (news.ycombinator.com) from the console"
url="https://github.com/$_gitauthor/$_gitname"
arch=('any')
license=('GPL')
depends=('python2-distribute' 'python-beautifulsoup')
makedepends=('git')
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"  
}
