# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

_pkgname=todotxt
pkgname=$_pkgname-git
pkgver=2.9.45.g111afe6
pkgrel=1
pkgdesc="lifehacker.com's todo.sh script for maintaining a todo.txt file"
arch=('i686' 'x86_64')
url="http://ginatrapani.github.com/todo.txt-cli/"
license=('GPL')
depends=('bash')
makedepends=('git')
install=$_pkgname.install
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname::git://github.com/ginatrapani/todo.txt-cli")
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

package() {
  cd "$srcdir/$_pkgname"

  install -D -m644 todo.cfg $pkgdir/usr/share/$_pkgname/todo.cfg
  install -D -m755 todo.sh $pkgdir/usr/bin/todo.sh
  install -D -m644 todo_completion $pkgdir/etc/bash_completion.d/todo
}
