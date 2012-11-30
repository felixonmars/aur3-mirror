# Contributer: giacomogiorgianni@gmail.com

pkgname=4kstogram-deb
name=4kstogram
pkgver=1.2
pkgrel=1
pkgdesc="4k Stogram is an client for Instagram on PC, Mac and Linux."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/four-k-stogram/"
license=('GPLv3')
depends=('libjpeg6' 'qt>=4.8')
install="$name.install"
#makedepends=('')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('57607c0511870e7d8d3e4bbacea5631c')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386' 
    md5sums=('97709237f06348ba2e668b2fed402ee0')
fi

source=("http://switch.dl.sourceforge.net/project/four-k-stogram/4k%20Stogram/1.2/linux/${name}_${pkgver}-${pkgrel}_${ARCH}.deb")
build() {
	cd ${startdir}/src
	#ar -x ${startdir}/src/dfm_${pkgver}_${ARCH}.deb
	tar -zxf ${startdir}/src/data.tar.gz
	cp -r ${startdir}/src/usr/ ${startdir}/pkg/
	# not compatiblr qt
	rm -- ${startdir}/pkg/usr/lib/4kstogram/libQt*
	#sed -i '6s|/usr/|exec /usr/|' ${startdir}/src/usr/lib/4kstogram/4kstogram.sh
	#mkdir ${pkgdir}/usr/bin
	install -D -m755 "${srcdir}/usr/lib/4kstogram/4kstogram.sh" "${pkgdir}/usr/bin/4kstogram" 
	#ln -s "/usr/lib/4kstogram/4kstogram.sh" "${pkgdir}/usr/bin/4kstogram"
}