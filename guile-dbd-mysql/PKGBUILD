# Contributor: tantalum <tantalum at online dot de>
pkgname=guile-dbd-mysql
pkgver=2.1.4
pkgrel=1
pkgdesc='guile-dbi database driver mysql'
arch=(i686 x86_64)
license=(GPL2)
depends=(guile 'guile-dbi>=2.1.2' libmysqlclient)
url=http://home.gna.org/guile-dbi/
source=(http://download.gna.org/guile-dbi/${pkgname}-${pkgver}.tar.gz)
md5sums=(3dc00c2f77524953723017c0958618b9)

build(){
 cd ${srcdir}/${pkgname}-${pkgver}
 ./configure --prefix=/usr || return 1
 make && make DESTDIR=${pkgdir} install || return 1

 #remove documentation
 if [ -e ${pkgdir}/usr/share/info/dir ]; then
  rm ${pkgdir}/usr/share/info/dir
 fi
}
