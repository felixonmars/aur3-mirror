# Contributor: Alessio Bianchi <venator85@gmail.com>
# Contributor: Jacek Roszkowski <j.roszk@gmail.com>

pkgname=brother-dcp365cn
pkgver=1.1.2
pkgrel=3
pkgdesc="Driver for the Brother DCP-365CN networked multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license='custom:brother'
depends=('a2ps' 'cups')
makedepends=('rpmextract')
install="brother-dcp365cn.install"
arch=('i686' 'x86_64')

md5sums=('8a8c0d106515ecb67952597fb0097211'
         'fed78a590420b8ce726c97ca748bf94e'
         '368d72e0ac3ee8c94098d657f307726d')

source=(
	'fix_lp.patch' \
    "http://pub.brother.com/pub/com/bsc/linux/dlf/dcp365cnlpr-$pkgver-1.i386.rpm" \
    "http://pub.brother.com/pub/com/bsc/linux/dlf/dcp365cncupswrapper-$pkgver-2.i386.rpm"
)

build()
{
	cd "$startdir/src"
	for i in *.rpm; do
		rpmextract.sh "$i" || return 1
	done
	patch -Np0 < ../fix_lp.patch || return 1
	cp -r usr/ ../pkg/ || return 1
	mkdir -p ../pkg/var/spool/lpd/dcp365cn
}

