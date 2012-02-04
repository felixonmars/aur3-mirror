# Contributor: Dak <dak.linux at gmail dot com>

pkgname=gtabdownloader
pkgver=0.7
pkgrel=1
pkgdesc="tuxguitar tablature downloader and starter"
arch=('i686' 'x86_64')
url="http://dakblog.wordpress.com/gtabdownloader/"
license=('GPL')
depends=('gtk2' 'python' 'pygtk')
source=(https://tools.assembla.com/svn/nocopy/users/Dak/gtabdownloader/$pkgname-$pkgver.tar.gz)
md5sums=('7deb1da0a8cfa7bb2ef8c686ef8e56da')


build()
{
	cd ${startdir}
	cp -R src/usr pkg/usr
}

