# Maintainer: Eric Forgeot < http://esclinux.tk >

pkgname=pmwiki-efo
pkgver=2011_09_21
pkgrel=1
pkgdesc="An adaptation of pmwiki using txt2tags as default syntax, to be used for creating a personal CMS or gallery"
arch=('any')
url="http://pmwiki-efo.googlecode.com"
license=('GPLv2')
depends=('')
optdepends=('php-apache' 'xampp')
source=(http://pmwiki-efo.googlecode.com/files/pmwiki-efo_2011-09-21_lerouge.zip)

md5sums=('8021685d5c1288ce975ef4f98098235f')


build() {
  cd $srcdir/${pkgname}
	mkdir -p $startdir/pkg/srv/http/
    cp -r $srcdir/$pkgname $startdir/pkg/srv/http/
    chmod -R 777 $startdir/pkg/srv/http/$pkgname
    echo -e "\n\nto configure php and apache see https://wiki.archlinux.org/index.php/Apache#PHP \n\n"
}


