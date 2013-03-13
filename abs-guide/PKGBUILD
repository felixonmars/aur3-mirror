# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com

pkgname=abs-guide
pkgver=6.6.12
pkgrel=1
pkgdesc="Advanced Bash Scripting HTML Guide"
arch=(any)
url="http://bash.deta.in"
license=('custom:"Open Publication License"')
source=("http://bash.deta.in/${pkgname}-latest.tar.bz2"
				"abs-guide" 
				"abs-guide.desktop"
)

build() {
	cd "${srcdir}"/abs
	mkdir -p "${pkgdir}"/usr/share/doc/abs-guide
	cp -r .   "${pkgdir}"/usr/share/doc/abs-guide/
	rm "${pkgdir}"/usr/share/doc/abs-guide/*.sgml
	chmod go+r,u+w "${pkgdir}"/usr/share/doc/abs-guide/*
}

package() {
	cd "${srcdir}"
# get real version
#	tmpver="$(sed -n 's/Current version = \(.*\)$/\1/p' abs/Change.log | tr -d ' ' )"
#	pkgver="$tmpver"
# install helper app & desktop file
	install -D -m755 "${srcdir}"/abs-guide "${pkgdir}"/usr/bin/abs-guide
	install -D -m644 "${srcdir}"/abs-guide.desktop	"${pkgdir}"/usr/share/applications/abs-guide.desktop
# license
	mkdir -p "${pkgdir}"/usr/share/licenses/$pkgname
	cd "${pkgdir}"/usr/share/licenses/$pkgname
	ln -s ../../doc/abs-guide/HTML/copyright.html copyright.html
}

# new release will be forced by different md5sum
# use 'makepkg -g' to build the latest guide

md5sums=('40b23bfe423e1b8e22d0a5dda173e4c1'
         '17a2a47e8c7edafdd9b40724ab155537'
         '84bcd8a9e9ebf239b0d8a3800e491a39')
