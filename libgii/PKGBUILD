###16.04.2013###geany###Vladimir Zashelkin <aka-novaspirit@yandex.ru>


pkgname=libgii
pkgver=1.0.2
pkgrel=1
pkgdesc="GGI input handling library"
arch=('i686' 'x86_64')
url="http://www.ggi-project.org/"
license="MIT"
groups=('ggi')
depends=('libxxf86dga')


source=(http://sourceforge.net/projects/ggi/files/ggi-core/libgii-1.0.2/$pkgname-$pkgver.src.tar.bz2)
#source=($pkgname-$pkgver.src.tar.bz2)
md5sums=('e002b3b3b7fae2b2558fe7ac854359b7')


build() {
	
cd ${startdir}
  
  echo 
echo "Название программы ============> ${pkgname}"
sleep 0.4
echo "Версия программы ==============> ${pkgver}"
sleep 0.4
echo "Начальный каталог =============> ${startdir}"
sleep 0.4
echo "Каталог с исходным кодом ======> ${srcdir}"
sleep 0.4
echo "Каталог с собранным пакетом ===> ${pkgdir}"
sleep 0.4
echo ""



echo ""
echo "Пуск"
sleep 2

 cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
  
}


package() {

cd ${srcdir}/${pkgname}-${pkgver}
make DESTDIR=${pkgdir} install

}



