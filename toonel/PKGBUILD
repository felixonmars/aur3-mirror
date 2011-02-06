# Maintainer: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=toonel
pkgver=005050
pkgrel=1
pkgdesc="toonel.net offers a technique to conserve network bandwidth by attempting to compress resources transferred thereby increasing connection throughput. "
arch=('i686' 'x86_64')
url="http://www.toonel.net/"
license=('')
depends=('java-runtime')
install='toonel.install'
source=(
'toonel.desktop' 'toonel.install' 'toonel.sh' 
"http://www.toonel.net/generic/$pkgver/toonel.jar")

build() {
	mkdir -p $startdir/pkg{/usr/bin,/usr/share/java/$pkgname}
    mkdir $startdir/pkg/usr/share/applications/

    install -m644 ${srcdir}/$pkgname.jar        ${pkgdir}/usr/share/java/$pkgname/
	install -m755 ${srcdir}/toonel.sh           ${pkgdir}/usr/bin/toonel
    install -m644 ${srcdir}/toonel.desktop      $startdir/pkg/usr/share/applications/
}

md5sums=(
'1ab0f52e557bd0aba385824f915c4d6a'  #toonel.desktop
'1e50c0c373543246115d0faa456d5616'  #toonel.install
'74e5a07f55eea0d53aeaa8fb68f8fae0'  #toonel.sh
'a00729ad6126933b90770eced3c37a95'  #toonel.jar
        )
