# Contributor: Rick Moore <xbj9000 :AT: comcast :DOT: net>

pkgname=gtklxsplit
pkgver=0.1.1
pkgrel=2
pkgdesc="GTK frontend for lxsplit"
arch=(i686 x86_64)
url="http://estudiantes.univalle.edu.co/~juanjmed/gtklxsplit/GTKlxsplit.html"
license=("GPL")
depends=('lxsplit' 'gtk')
source=("http://estudiantes.univalle.edu.co/~juanjmed/gtklxsplit/packages/gtklxsplit-0.1.1.tar.gz"
	"http://electronicplaygirl.com/arch/gtklxsplit/make.patch"
	"http://electronicplaygirl.com/arch/gtklxsplit/gtklxsplit.desktop.txt")
md5sums=('e36019ce06ef31786aea43ac78061a35'
	 '3e2f18594fff7552359d1bc3b671a361'
	 'a5b34f7a4401a29a3b7c3a9b243af8af')

build() {
  mkdir $startdir/pkg/usr
  mkdir $startdir/pkg/usr/bin
  mkdir $startdir/pkg/usr/share
  mkdir $startdir/pkg/usr/share/applications
  patch $startdir/src/gtksplit/Makefile < $startdir/make.patch || return 1
  cd $startdir/src/gtksplit  
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  cp $startdir/gtklxsplit.desktop.txt $startdir/pkg/usr/share/applications/gtklxsplit.desktop
}
