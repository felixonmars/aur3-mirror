# Contributor grimi@poczta.fm
# Maintainer: Leigh <leigh@archlinux.us>

pkgname=kmd5
pkgver=0.9.0
pkgrel=3
pkgdesc="KDE GUI application for computing MD5 checksums"
arch=('i686' 'x86_64')
url="http://lukemurphey.net/kmd5"
license=('GPL')
depends=('kdelibs3')
makedepends=('unzip')
source=(http://lukemurphey.net/Files/$pkgname.zip)
md5sums=('96c9eaf202b4b92a5e7a00b46179d266')


build() {
. /etc/profile.d/qt3.sh
. /etc/profile.d/kde3.sh
cd $startdir/src/home/luke/$pkgname
./configure --prefix=/opt/kde --without-arts
make || return 1
make install DESTDIR=$startdir/pkg
install -d $startdir/pkg/opt/kde/share/apps/konqueror/servicemenus
install -m644 md5sum-dir.desktop $startdir/pkg/opt/kde/share/apps/konqueror/servicemenus
install -m644 md5sum-file.desktop $startdir/pkg/opt/kde/share/apps/konqueror/servicemenus
install -d $startdir/pkg/opt/kde/share/pixmaps
install -m644 Misc/kmd5.png $startdir/pkg/opt/kde/share/pixmaps
}
