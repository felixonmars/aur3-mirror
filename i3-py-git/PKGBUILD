# Maintainer: willemw <willemw12@gmail.com>

_pkgname=i3-py
pkgname=$_pkgname-git
pkgver=r156.27f88a6
pkgrel=1
pkgdesc="Python based tools for i3 users and developers"
arch=('any')
url="https://github.com/ziberna/i3-py"
license=('GPL3')
depends=('i3-wm' 'python')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/ziberna/i3-py.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1


  # Optional: install examples

  cd examples
  # Install all examples: cycle.py fibonacci.py ipc.py scratcher.py winmenu.py wsbar.py
  #for i in *.py
  # Install some of the useful examples
  for i in ipc.py scratcher.py winmenu.py wsbar.py
  do
    install -Dm 755 "$i" "$pkgdir/usr/bin/i3-$i"
  done
}

