pkgname=pyusecase
pkgver=3.5
pkgrel=6
pkgdesc="UI test tool, consisting of a generic framework and implementations for PyGTK, Tkinter, wxPython and SWT."
arch=(any)
url="http://texttest.carmen.se/index.php?page=ui_testing&n=xusecase"
license=('LGPL')
depends=(python2 pygtk)
backup=()
noextract=()
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.zip)
md5sums=('a411f43d43796a147dfda6746804fe88')

replace_python_with_python2() {
  mv $1 tmp || return 1
  cat tmp | sed 's/python/python2/g' > $1 || return 1
  rm tmp || return 1
  chmod 755 $1 || return 1
}

build() {
  cd "$srcdir"
  install -d -m0755 $pkgdir/usr/share || return 1
  mv $pkgname-$pkgver $pkgdir/usr/share/$pkgname || return 1

  pyusecase=$pkgdir/usr/share/$pkgname/source/bin/$pkgname
  replace_python_with_python2 $pyusecase

  install -d -m0755 $pkgdir/usr/bin || return 1
  ln -s /usr/share/$pkgname/source/bin/$pkgname $pkgdir/usr/bin/$pkgname || return 1

  replace_python_with_python2 $pkgdir/usr/share/$pkgname/source/bin/usecase_name_chooser
}
