# Maintainer: Christos Nouskas <nous at archlinux dot us>
# 24 May 2010

pkgname=lightsquid
_pkg="download"
pkgver=1.8
pkgrel=1
pkgdesc="A light and fast squid log analyzer"
arch=('i686' 'x86_64')
url="http://lightsquid.sourceforge.net/"
license=('GPL2')
depends=('perl-gd')
source=(http://sourceforge.net/projects/lightsquid/files/lightsquid/1.8/lightsquid-1.8.tgz/download
	lightsquid.install
	arch-fsh.patch)		# /usr/share/webapps fix
md5sums=('310a7e16017290232183753d73f3559d'
	 'b4b161dfff428a939a7f8c08a543cf9f'
	 '3a8810fc3e8494c84f994f41dc01a02f')
noextract=($_pkg)
install=lightsquid.install

build() {
  mkdir -p $pkgdir/usr/share/webapps/$pkgname
  cd $pkgdir/usr/share/webapps/$pkgname
  tar --strip-components=1 -zxf $startdir/$_pkg
  patch -p1 -i $startdir/arch-fsh.patch
  chmod +x *.pl *.cgi
}
