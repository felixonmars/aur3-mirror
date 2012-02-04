# Contributor: Svetlin Tassev <>

pkgname=kiwix
_pkgver=0.9
_pkgsubversion=alpha7
pkgver=0.9_alpha7
pkgrel=2
pkgdesc="Offline reader for Web content. It's especially thought to make Wikipedia available offline. You can download a zim archive of Wikipedia from the project website to use with kiwix."
arch=(i686 x86_64)
url="http://www.kiwix.org"
license=('GPL3')
depends=('libmicrohttpd' 'xz' 'xulrunner>=1.9.2' 'xapian-core' 'icu' 'gcc' 'pkg-config' 'clucene' 'make')

source=(http://sourceforge.net/projects/$pkgname/files/$pkgname-${_pkgver}-${_pkgsubversion}-src.tar.bz2/download)
md5sums=('f517e95ab38ee657de8fd72fe2794ee9')

build() {
  cd "$srcdir"/$pkgname-${_pkgver}
  ./configure --prefix=/usr
  make || return 1 
}

package() {
	cd ${pkgname}-${_pkgver}
	make DESTDIR=${pkgdir} install
	ln -f -s /usr/lib/kiwix/kiwix.sh ${pkgdir}/usr/bin/kiwix
	ln -f -s /usr/lib/kiwix/kiwix-compact.sh ${pkgdir}/usr/bin/kiwix-compact
}