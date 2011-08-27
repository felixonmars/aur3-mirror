
pkgname=geany-cp1251
pkgver=0.19
pkgrel=3
pkgdesc="The plugin for Geany to Auto detect cp1251 codepage. (Turn on in Plugin Manager)"
arch=('i686' 'x86_64')
url="http://welinux.ru/post/1424"
license=('GPL')
depends=('geany')
source=(cp1251.c)
md5sums=('7d52ea5046853c157b7ec572c320495f')

build() {
  cd ${srcdir}

  cc -DGTK -O3 -fpic -shared cp1251.c -o cp1251.so -I/usr/include/geany -I/usr/include/gtk-2.0 -I/usr/include/glib-2.0/ -I/usr/lib/glib-2.0/include -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/geany/tagmanager -I/usr/include/geany/scintilla -I/usr/include/gdk-pixbuf-2.0  
  
  mkdir -p ${pkgdir}/usr/lib/geany
  cp cp1251.so ${pkgdir}/usr/lib/geany

}
