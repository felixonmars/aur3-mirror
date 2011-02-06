# Maintainer: Olli Laasonen <admin at laasonen dot net>

pkgname=srcds
pkgver=1.0.0
pkgrel=11
pkgdesc="A tool that runs the dedicated server component of a Source game without the client component."
url="http://www.srcds.com/"
install="srcds.install"
arch=('i686' 'x86_64')
license=('custom')
[ "${CARCH}" = "x86_64" ] && depends=('lib32-glibc')
optdepends=("srcds-launcher: for easier and faster starting of orangebox servers" "sudo: for running servers and installing games as normal user")
source=('http://www.steampowered.com/download/hldsupdatetool.bin' license steam srcds srcds.install)
md5sums=('3d92b54b74387e3881b35b92d09d8e16' '7e5993b4d388b655615481ee1ad1073d' 'ca14d4d733aa7afd727b3d9ba02d6f01' 'f3767c1660c2866e6c64a41fe9a56ad8' '942d9109bbe76f098b93868649ce14f8')

build(){
	if [ -a $srcdir/$pkgname-$pkgver ]
	then
		echo "Deleting old build folder.."
		rm -R $srcdir/$pkgname-$pkgver
		echo ""
	fi
	echo "Preparing files.."
	mkdir $srcdir/$pkgname-$pkgver
	cp hldsupdatetool.bin $srcdir/$pkgname-$pkgver
	cd $srcdir/$pkgname-$pkgver
	chmod +x hldsupdatetool.bin
	chmod +x $srcdir/steam
	chmod +x $srcdir/srcds
	echo ""
	echo "Installing.."
	echo "yes" | ./hldsupdatetool.bin >> /dev/null
	echo ""
	echo "Updating.."
	sh -c "./steam >> /dev/null; true"
	echo ""
	echo "Updating again.."
	sh -c "./steam >> /dev/null; true"
	echo ""
	echo "Coping files.."
	install -d $pkgdir/usr/bin
	install -d $pkgdir/opt/srcds/
	install -d $pkgdir/usr/share/licenses/srcds/
	cp $srcdir/license $pkgdir/usr/share/licenses/srcds/LICENSE
	cp $srcdir/steam $pkgdir/usr/bin/steam
	cp $srcdir/srcds $pkgdir/usr/bin/srcds
	cp -r {readme.txt,steam,test1.so,test2.so,test3.so} $pkgdir/opt/srcds/
}
