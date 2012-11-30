# This builds the g729 module for FreeSWITCH
# Maintainer:  <rootraa(at)gmail(dot)com>

pkgname=fs_g729_itu
pkgver=0.1
pkgrel=1
pkgdesc="G.729 module for FreeSWITCH"
arch=('any')
url="ftp://icf.org.ru/pub/soft/codecs"
license=('no free')
depends=('freeswitch-git')
source=($url/fs-mod_g729-itu.tar.bz2 \
        Makefile.patch \
        fs_g729_itu.install)
md5sums=(	'a1dedbed0815bbe79ef30012dc286d54'
		'fadb441297a731cdae23cc754fa44461'
		'4326177b6f1172310159277f19b80acf')
install=$pkgname.install

build() {
  cd "$srcdir"
  patch -p0 -i ./Makefile.patch || return 1
  cd "$srcdir/mod_g729-itu"
  make || return 1
}

package(){
		install -D -m 755 ${srcdir}/mod_g729-itu/mod_g729.so ${pkgdir}/usr/lib/freeswitch/mod/mod_g729.so
}