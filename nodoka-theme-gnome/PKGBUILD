# Contributor: lp76 <l.peduto@gmail.com>
pkgname=nodoka-theme-gnome
pkgver=0.3.90
pkgrel=2
pkgdesc="Themes for Nodoka GTK engine"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/nodoka"
license=('GPL')
depends=('gtk-engine-nodoka')
source=(https://fedorahosted.org/releases/n/o/nodoka/nodoka-theme-gnome-0.3.90.tar.gz)
md5sums=('d259520f5960553d92f023917428d4ee')

build() {
  cd $startdir/src/nodoka-theme-gnome-0.3.90
  mkdir -p $startdir/pkg/usr/share/themes
  cp -r Nodoka $startdir/pkg/usr/share/themes
}
