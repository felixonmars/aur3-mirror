# Maintainer: DUCRETTET Philippe <ecolinux@gmx.fr>

pkgname=gtkwrap
pkgver=0.1
pkgrel=1
pkgdesc="Create Your gui in Glade(GtkBuilder) and use it in your shell scripts."
arch=('i686' 'x86_64')
url="https://github.com/abecadel/gtkwrap"
license=('GPL')
depends=('glade')
conflicts=( 'gtkwrap-git' )
replaces=( 'gtkwrap-git' )
source=( "http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-0.1/$pkgname-0.1.tar.gz" )

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $pkgdir
  dir="usr usr/bin usr/share usr/share/gtk-wrap usr/share/gtk-wrap/DEMO"
  for i in $dir ; do
	mkdir $i
  done
  cd $srcdir/$pkgname
  install -D -m755 gtk-wrap $pkgdir/usr/bin/gtk-wrap
  install -D -m644 DEMO/* $pkgdir/usr/share/gtk-wrap/DEMO
}

md5sums=('76c00fb2508207f599e1a138e0fc1584')
