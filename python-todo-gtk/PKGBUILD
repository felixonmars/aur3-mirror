# Maintainer: Kyle Hopkins <kylehopkins1215@gmail.com>
pkgname='python-todo-gtk'
pkgver='0.1'
pkgrel=1
pkgdesc="A simple GTK+3 todo list application"
arch=(any)
url="https://github.com/Kopkins/ToDo"
license=('GPL')
groups=()
depends=('python' 'git' 'gtk3' 'pygtk')
makedepends=('python-setuptools')
provides=('todo-gtk')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=''
source=()
md5sums=()
_gitroot='https://github.com/Kopkins/ToDo'
_gitname='ToDo'

build() {
  cd "$srcdir"
  msg "Getting files from git server...."
  git clone "$_gitroot" "$_gitname-build"
}

package() {
  
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 todo.desktop "${pkgdir}/usr/share/applications/${_gitname}.desktop"
  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/python-todo-gtk/COPYING.txt"
  install -Dm755 python-todo "${pkgdir}/usr/bin/python-todo"
}

# vim:set ts=2 sw=2 et:

