pkgname=peg-markdown-git
pkgver=20130806
pkgrel=4
pkgdesc="An implementation of markdown in C, using a PEG grammar"
arch=('i686' 'x86_64')
url="https://github.com/jgm/peg-markdown/"
license=('GPL' 'MIT')
depends=('glib2')
makedepends=('git')
provides=('markdown')
conflicts=('markdown')
source=('peg-markdown-git::git://github.com/jgm/peg-markdown.git')
md5sums=('SKIP')

#_gitname=${pkgname%-git}

pkgver() {
#  cd $_gitname
  cd $pkgname
#  git describe --always | sed 's|-|.|g'
  echo $(git describe | sed 's#-#_#g;s#v##')
}

build() {
#  cd $_gitname
  cd $pkgname
  make CC="cc -fPIC"
}

package() {
#  cd $_gitname
  cd $pkgname
  install -Dm755 markdown "$pkgdir"/usr/bin/markdown
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/peg-markdown/LICENSE
}
