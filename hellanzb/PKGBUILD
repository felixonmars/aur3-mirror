# Maintainer: Jarek Sedlacek <jareksedlacek@gmail.com>

pkgname=hellanzb
pkgver=0.13
pkgrel=11
pkgdesc="nzb downloader and post processor"
url="http://www.hellanzb.com"
depends=('python2' 'twisted-web2' 'par2cmdline' 'unrar')
optdepends=('pyopenssl: for SSL')
source=("http://distfiles.macports.org/python/$pkgname-$pkgver.tar.gz" \
"hellanzb.rc" "hellanzb.conf.d" "whitespace-fix.diff" "python_26_fixes.diff" "version.diff" "fileno.diff")
arch=('i686' 'x86_64')
license='BSD'
install=hellanzb.install
backup=('etc/conf.d/hellanzb')

build() {
	cd $startdir/src/$pkgname-$pkgver

	# change the configuration directories searched from /usr/etc to /etc and
	# from ./etc to ~/.config
	sed -i \
		-e "\|confDirs = |s|sys.prefix|'/'|" \
		-e "\|confDirs\.append|s|join(os.getcwd(), *'etc|expanduser('~/.config|" \
		Hellanzb/Core.py 

	# fix the problem with whitespace in the group name
	patch -p1 < ../whitespace-fix.diff 
	patch -p0 < ../python_26_fixes.diff 
	patch -p0 < ../version.diff 
	patch -p0 < ../fileno.diff 

	python2 ./setup.py install --root=$startdir/pkg 

	# move /usr/etc to /etc
	mv $startdir/pkg/usr/etc $startdir/pkg/

	install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE

	# install the rc scripts
	cd $startdir
	mkdir -p $startdir/pkg/etc/{rc.d,conf.d}
	install -D -m755 hellanzb.rc $startdir/pkg/etc/rc.d/hellanzb
	install -D -m644 hellanzb.conf.d $startdir/pkg/etc/conf.d/hellanzb

}
md5sums=('d3510c6b1b2c7b935332a469fdc8e7e2'
         '85a0e75581781a4854bdc4903118773b'
         '0bda37be41e3d0662bd8cdb0fdff6a20'
         'be7ccbed81e98c43c59a10ab64992f7c'
         '86888247312f7b95df9c914e920e04b4'
         '74524bbc8b2c3a7524312af374bf3036'
         'bce7219444aff088787227cc1c7f6f2f')
