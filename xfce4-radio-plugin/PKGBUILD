# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Piotr Husiatynski <phusiatynski@gmail.com>

pkgname=xfce4-radio-plugin
pkgver=0.5.1
pkgrel=1
pkgdesc="Xfce panel plugin which allows you to control your V4l radio device"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-radio-plugin"
license=('GPL3')
depends=('xfce4-panel' 'libxfcegui4')
makedepends=('intltool' 'pkg-config')
source=(http://archive.xfce.org/src/panel-plugins/xfce4-radio-plugin/0.5/$pkgname-$pkgver.tar.bz2)
install=$pkgname.install

md5sums=('237001f3a134c28c16bcd07b57168150')

build() 
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make || return 1
    make DESTDIR=${pkgdir} install
}
