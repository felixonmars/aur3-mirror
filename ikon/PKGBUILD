#Contributor: Flamelab <panosfilip@gmail.com>

pkgname=ikon
pkgver=1_prealpha
pkgrel=1
pkgdesc="Application for editing Icon themes, with a drag and drop interface."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Ikon?content=122493&PHPSESSID=07c09358354d17917d9d47f0ec55d059"
depends=('kdebase-workspace>=4.4.0')
makedepends=('cmake' 'automoc4' 'gcc')
source=("http://kde-apps.org/CONTENT/content-files/122493-${pkgname}.tar.gz")
license=('GPL')


build() 

{
        cd $srcdir/${pkgname}
        cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release .
        make || return 1
        make DESTDIR=$pkgdir install
}

md5sums=('bae9fc3435a649c03c1853035bccc693')
