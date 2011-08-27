# Contributor:  Artyom Smirnov <smirnoffjr@gmail.com>
pkgname=gdm-archfamily
oriname=Arch_Family
pkgver=0.1
pkgrel=1
pkgdesc='ArchLinux GDM theme'
arch=('i686' 'x86_64')
url='http://gnome-look.org/content/show.php/Archlinux+Family+GDM?content=62036'
license=('GPL')
depends=('gdm')
source=(http://gnome-look.org/CONTENT/content-files/62036-Arch_Family.tar.gz)
md5sums=(9d1be6ee1a92d46515b9a670185a6a11)

build() {
	mkdir -p $startdir/pkg/usr/share/gdm/themes/$oriname
 	cd $startdir/pkg/usr/share/gdm/themes/$oriname
 	install -m644 $startdir/src/$oriname/*.* ./
}
# vim:syntax=sh
