# Maintainer: eri

pkgname=abs-guide-ru
pkgver=2.5
pkgrel=4
pkgdesc="Advanced Bash Scripting Guide"
arch=(any)
url="http://gazette.linux.ru.net/rus/articles/index-abs-guide.html"
license=(custom)


source=("http://gazette.linux.ru.net/archive/abs-guide-${pkgver}-flat.tar.gz"
				"${pkgname}.desktop"
)

build() {
								#cd "${srcdir}"/abs
	mkdir -p "${pkgdir}"/usr/share/doc/${pkgname}/html
	cp abs-book.html   "${pkgdir}"/usr/share/doc/${pkgname}/html/
	cp -r misc/abs-book/images   "${pkgdir}"/usr/share/doc/${pkgname}/
	
							#rm "${pkgdir}"/usr/share/doc/${pkgname}/*.sgml
	chmod -R go+r,u+w "${pkgdir}"/usr/share/doc/${pkgname}/*
}

package() {
	cd "${srcdir}"
		# get real version
		#	tmpver="$(sed -n 's/Current version = \(.*\)$/\1/p' abs/Change.log | tr -d ' ' )"
		#	pkgver="$tmpver"
		# install helper app & desktop file
		#	install -D -m755 "${srcdir}"/abs-guide "${pkgdir}"/usr/bin/abs-guide
	install -D -m644 "${srcdir}"/${pkgname}.desktop	"${pkgdir}"/usr/share/applications/${pkgname}.desktop

# license
#	mkdir -p ${pkgdir}"/usr/share/licenses/$pkgname"
#	cd ${pkgdir}"/usr/share/licenses/$pkgname"
#	ln -s ../../doc/abs-guide/HTML/copyright.html copyright.html
}

# new release will be forced by different md5sum
# use 'makepkg -g' to build the latest guide
md5sums=('01eab31052fc64be3c54c80b9c54e3b7'
         '739ae3827099bdd0f8100a36c8368bd1')
