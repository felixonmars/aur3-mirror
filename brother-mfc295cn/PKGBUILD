# Maintainer: Eric Anschuetz <ericanschuetz@yahoo.com>
pkgname=brother-mfc295cn
pkgver=1.1.2
pkgrel=2
pkgdesc="Driver for the Brother MFC-295CN network printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')

if [ $CARCH == "x86_64" ]; then
	depends=('lib32-libcups' 'a2ps' 'psutils')
else
	depends=('a2ps' 'psutils')
fi

makedepends=('rpmextract')
arch=('i686' 'x86_64')
source=(
	http://www.brother.com/pub/bsc/linux/dlf/mfc295cnlpr-1.1.2-1.i386.rpm
	http://www.brother.com/pub/bsc/linux/dlf/mfc295cncupswrapper-1.1.2-2.i386.rpm
)
md5sums=('83bdcf5533633c2883595cb87c31773e'
         'ca3fbf051094445db430261c069a1837')

build()
{
	cd $srcdir
	for i in *.rpm; do
		rpmextract.sh "$i" || return 1
	done
	sed -i 's|/etc/init.d|/etc/rc.d|' usr/local/Brother/Printer/mfc295cn/cupswrapper/cupswrappermfc295cn
}

package()
{	
	cp -r $srcdir/* $pkgdir  || return 1
} 
