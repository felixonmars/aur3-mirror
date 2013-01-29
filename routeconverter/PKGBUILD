# Maintainer: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
pkgname=routeconverter
pkgver=2.8.3
pkgrel=1
pkgdesc="A free tool to edit and convert routes, tracks and waypoints."
arch=(i686 x86_64)
url="http://www.routeconverter.de/en"
license=('GPL')
depends=('java-environment>=6' 'libwebkit3')
optdepends=('gpsbabel: for some additional format support')
changelog=ChangeLog
source=(routeconverter
        routeconverter-cli
        http://www.routeconverter.de/download/RouteConverterCmdLine.jar)
[ "$CARCH" == "i686" ]   && source=(${source[@]} http://www.routeconverter.de/download/RouteConverterLinux.jar)
[ "$CARCH" == "x86_64" ] && source=(${source[@]} http://www.routeconverter.de/download/RouteConverterLinux64.jar)

md5sums=('4bc45e6a1a93656a0deb8956f71b6af8'
         'fdf570309917df1c1536b7e3c7740b33'
         'eacfd72344ef6a61919937b1fea0f8f7')
[ "$CARCH" == "i686" ]   && md5sums=(${md5sums[@]} 'eb99fdf876bf2cbe8b9f85e8ffa5ea46')
[ "$CARCH" == "x86_64" ] && md5sums=(${md5sums[@]} '8d99d74806864946803131d7ecef9795')

noextract=(RouteConverterCmdLine.jar
           RouteConverterLinux.jar
           RouteConverterLinux64.jar)

build()
{
  cd "$srcdir"
}

package()
{
  cd "$srcdir"

  install -m 755 -o root -g root -d ${pkgdir}/usr/bin
  install -m 755 -o root -g root -d ${pkgdir}/usr/lib/${pkgname}
  install -m 755 -o root -g root \
			${srcdir}/routeconverter \
			${srcdir}/routeconverter-cli \
			${pkgdir}/usr/bin/
  install -m 644 -o root -g root \
			${srcdir}/RouteConverterCmdLine.jar \
			${pkgdir}/usr/lib/${pkgname}/

  [ "$CARCH" == "i686" ] && \
  install -m 644 -o root -g root \
			${srcdir}/RouteConverterLinux.jar \
			${pkgdir}/usr/lib/${pkgname}/ || true

  [ "$CARCH" == "x86_64" ] && \
  install -m 644 -o root -g root \
			${srcdir}/RouteConverterLinux64.jar \
			${pkgdir}/usr/lib/${pkgname}/ || true

  ln -s /usr/lib/libwebkitgtk-1.0.so.0 ${pkgdir}/usr/lib/${pkgname}/libwebkit-1.0.so.2
  ln -s libwebkit-1.0.so.2 ${pkgdir}/usr/lib/${pkgname}/libwebkit-1.0.so
}

