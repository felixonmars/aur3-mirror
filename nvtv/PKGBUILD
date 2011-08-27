# Contributor: Desislav <DesislavPetrov@gmail.com>

pkgname=nvtv
pkgver=0.4.7
pkgrel=5
pkgdesc="This is a tool to enable TV-Out on Linux for NVidia cards."
url="http://sourceforge.net/projects/nv-tv-out/"
depends=('xorg-server')
md5sums=('35348d7608f94b7d114cd6ef46b66fc7'
         '7a2b252402a23a1c5559bd3cda4a8b3a')
source=(http://dl.sourceforge.net/sourceforge/nv-tv-out/$pkgname-$pkgver.tar.gz \
        http://aur.archlinux.org/packages/nvtv/nvtv/nvtvd)

build () {
cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr
   make || return 1
   install -d $startdir/pkg/etc/rc.d
   install -m755 $startdir/nvtvd $startdir/pkg/etc/rc.d/nvtvd
   make DESTDIR=$startdir/pkg install
 }