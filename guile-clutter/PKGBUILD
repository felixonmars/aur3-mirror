# Contributor: tantalum <tantalum@online.de>
pkgname=guile-clutter
pkgver=1.10.0
pkgrel=1
pkgdesc='Guile Scheme bindings for the Clutter graphics library'
arch=(any)
license=(GPL2)
depends=('guile>=1.6.4' 'g-wrap>=1.9.1' 'clutter>=0.7' 'guile-gnome-platform-git>=2.16.1')
url=http://www.gnu.org/software/guile-gnome/docs/clutter/
source=(http://ftp.gnu.org/gnu/guile-gnome/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=(ea5566b45f0b9b395f52c562beb4d0ee)
build () {
 cd ${srcdir}/${pkgname}-${pkgver}

 #setting cppflags because of "ffi.h not found" error
 #export CPPFLAGS=$(pkg-config --cflags libffi)

 ./configure --prefix=/usr
 make && make DESTDIR=${pkgdir} install
}
