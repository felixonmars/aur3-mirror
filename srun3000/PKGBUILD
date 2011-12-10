#Maintainer: dongfengweixiao <dongfengweixiao at googlemail dot com>

pkgname=srun3000
pkgver=ubuntu9.10
pkgrel=2
pkgdesc="Srun3000 client for linux"
url="http://www.srun.com/"
arch=('i686' 'x86_64')
license=('custom')
if [ "$CARCH" = "i686" ]; then
	_arch='i686'
	source=('http://gthemes-china.googlecode.com/files/srun_client_ubuntu9.10_i686.tar.gz')
	md5sums=('26e6700550e40fe633390cede7288d47')
elif [ "$CARCH" = "x86_64" ]; then
	_arch='amd64'
	source=('http://gthemes-china.googlecode.com/files/srun_client_ubuntu9.10_amd64.tar.gz')
	md5sums=('09ec9e4966a1f15e38024080d52f2edf')    
fi
package() {
if [ "$CARCH" = "i686" ]; then
	_arch='i686'
	mkdir -p $pkgdir/usr/share
	mkdir -p $pkgdir/usr/share/applications/
	cp -rf  $srcdir/srun_client_ubuntu9.10_i686/srunsoft $pkgdir/usr/share/srun3000
	mv $pkgdir/usr/share/srun3000/宽带认证.desktop $pkgdir/usr/share/applications/   
elif [ "$CARCH" = "x86_64" ]; then
	_arch='amd64'
	mkdir -p $pkgdir/usr/share
	mkdir -p $pkgdir/usr/share/applications/
	cp -rf  $srcdir/srun_client_ubuntu9.10_amd64/srunsoft $pkgdir/usr/share/srun3000
	mv $pkgdir/usr/share/srun3000/宽带认证.desktop $pkgdir/usr/share/applications/
fi
}
#抱歉，我的电脑是64位的，所以32位的脚本写出来可能有问题，所以各位32位用户发现有问题请及时告知我。
