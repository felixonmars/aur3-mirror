pkgname=gdb-qt4-pretty-git
pkgver=20130104
pkgrel=1
pkgdesc="A GNU debugger extension for Qt4 pretty printers"
arch=('any')
url="http://quickgit.kde.org/index.php?p=kdevelop.git"
license=('custom')
depends=('gdb')
makedepends=('git')
install=gdb-qt4-pretty.install
source=('__init__.py' 'gdb-qt4-pretty.gdb' 'gdb-qt4-pretty.install' 'printers.py::http://quickgit.kde.org/index.php?p=kdevelop.git&a=blob_plain&h=144fcf38ff8ff89d5f63c414417ec2baf9feaf16&f=debuggers%2Fgdb%2Fprinters%2Fqt4.py')
md5sums=('68b329da9893e34099c7d8ad5cb9c940'
         'ce22e92fee819e9c5bf81516844e7aca'
         'cddd1bc2e8c0f7daa97603190179e52b'
         'c543bf0399ecaf39937b034ea8be838b')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/gdb/gdb-qt4-pretty"
  install -d "$pkgdir/usr/share/gdb/gdb-qt4-pretty/qt4"

  install -m644 "$srcdir/printers.py" "$pkgdir/usr/share/gdb/gdb-qt4-pretty/qt4"
  install -m644 "$srcdir/__init__.py" "$pkgdir/usr/share/gdb/gdb-qt4-pretty/qt4"
  install -m644 "$srcdir/gdb-qt4-pretty.gdb" "$pkgdir/usr/share/gdb/gdb-qt4-pretty"
}
