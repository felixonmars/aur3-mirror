# Author: Aliaksandr Stelmachonak a.k.a ava1ar <mail.avatar at gmail.com>

pkgname=thunar-djvu-thumbnailer
pkgver=0.1
pkgrel=4
pkgdesc="Adds support of DjVu thumbnail to Thunar file manager" 
license=('GPL')
arch=('i686' 'x86_64')
depends=('evince')
url="http://thunar.xfce.org" 
install=thunar-djvu-thumbnailer.install
source=(https://dl.dropboxusercontent.com/u/4514366/AUR/${pkgname}-${pkgver}.tar.gz) 
md5sums=('dd25e15d28070f5eb41aa733b177a2a1')

build()
{ 
  	cd ${srcdir}/${pkgname}-${pkgver}
	install -D -m 755 djvu-thumbnailer ${pkgdir}/usr/lib/xfce4/djvu-thumbnailer
	install -D -m 644 djvu-thumbnailer.desktop ${pkgdir}/usr/share/thumbnailers/djvu-thumbnailer.desktop
}
