# Maintainer: Nuno Henriques <nuno.amhenriques@gmail.com>

pkgname=remmina-xfce
pkgver=0.8.1
pkgrel=1
pkgdesc="Xfce applet for the Remmina remote desktop application."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/remmina/"
license=('GPL')
source=("http://downloads.sourceforge.net/project/remmina/0.8/remmina-xfce-$pkgver.tar.gz")
depends=('remmina' 'xfce4-panel')
makedepends=('intltool')
options=(!libtool)
md5sums=('7b95ed26f6518d26166904ef63d1b936')

build()
{
  cd remmina-xfce-$pkgver
  ./configure --prefix=/usr --enable-nls --enable-avahi 
  make 
}

package()
{  
  cd remmina-xfce-$pkgver  
  make DESTDIR=$pkgdir install
}

