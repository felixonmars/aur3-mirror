# Maintainer: John Bartholomew <jpa.bartholomew@gmail.com>

pkgname=kabikaboo
pkgver=1.7
pkgrel=1
pkgdesc="a tree-based notepad and book planning tool"
arch=(any)
url="https://launchpad.net/kabikaboo"
license=('GPL')
depends=('gnome-python' 'python2-gtkspell' 'pygtksourceview2')
source=(
  http://launchpad.net/kabikaboo/current/$pkgver/+download/$pkgname-$pkgver.tar.gz
  0-use-python2.patch 1-remove-tabs.patch 2-run-reindent.patch)
md5sums=('d057c3f6609a1824376bf6c97fd38f14' '8ae3c454b663709f44c85f50988b3c5d'
         '56d33468329aa70094f14e0a1fb10d53' '7c3a82b0580c20eee806abad63cd1633')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg "Applying source patches..."
  patch -Nup1 < ../0-use-python2.patch
  patch -Nup1 < ../1-remove-tabs.patch
  patch -Nup1 < ../2-run-reindent.patch

  msg "Compiling python sources to bytecode..."
  python2 -O -m compileall ./src/*.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
 
  msg "Constructing install tree..."
  # exec script
  install -d "$pkgdir"/usr/bin
  install ./kabikaboo "$pkgdir"/usr/bin/
  # desktop environment things
  install -d "$pkgdir"/usr/share/kabikaboo
  install -d "$pkgdir"/usr/share/applications
  cp ./kabikaboo.png "$pkgdir"/usr/share/kabikaboo/
  cp ./kabikaboo.desktop "$pkgdir"/usr/share/applications/
  # source code
  install -d "$pkgdir"/usr/share/kabikaboo/{src,ui}
  cp ./src/*.py "$pkgdir"/usr/share/kabikaboo/src/
  cp ./src/*.pyo "$pkgdir"/usr/share/kabikaboo/src/
  cp ./ui/*.glade "$pkgdir"/usr/share/kabikaboo/ui/
  # documentation
  install -d "$pkgdir"/usr/share/man/man1
  cp ./man/kabikaboo.1 "$pkgdir"/usr/share/man/man1/
  install -d "$pkgdir"/usr/share/gnome/help
  cp -R ./help "$pkgdir"/usr/share/gnome/help/kabikaboo/
}

# vim:set ts=2 sw=2 et:
