# Maintainer: Adam <adam900710@gmail.com>
pkgname='ninix-aya'
pkgver=4.99.18
pkgrel=1
pkgdesc="A desktop mascot programe compatible with 'Ukagaka'."
arch=('any')
url="http://sourceforge.jp/projects/ninix-aya/"
license=('GPLv2')
depends=('python' 'pygtk' 'gtk3' 'python-numpy' 'python-gobject')
optdepends=('gstreamer0.10-python' 'python-chardet')
source=(http://dl.sourceforge.jp/$pkgname/59880/$pkgname-$pkgver.tgz)
md5sums=('50b7fbed62bf0007a2a41069333e0736')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install prefix="${pkgdir}/usr"
	# Since the Makefile use static prefix, manualy change the libpath
  	sed -e "s,@python,python,g" -e "s,@libdir,/usr/lib/ninix,g" ${srcdir}/${pkgname}-${pkgver}/bin/ninix.in > ${pkgdir}/usr/bin/ninix
	
	# Fix the doc path
  	install -d ${pkgdir}/usr/share/doc/${pkgname}
  	mv ${pkgdir}/usr/doc/* ${pkgdir}/usr/share/doc/${pkgname}
	rm ${pkgdir}/usr/doc -rf
}
