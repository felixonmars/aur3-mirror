# Maintainer: M4rQu1Nh0s <zonadomarquinhos@gmail.com>
pkgname=dmz-cursor-theme
pkgver=0.4.3
pkgrel=1
pkgdesc="Style neutral, scalable cursor theme This package contains the DMZ cursor themes. Black and white cursors are provided, in scalable formats. (Debian Version)"
arch=(any)
url="http://ftp.br.debian.org"
license=('MIT')
groups=('x11')
source=(http://cdn.debian.net/debian/pool/main/d/dmz-cursor-theme/dmz-cursor-theme_0.4.3_all.deb)
md5sums=('fba8ab6a3ae628962936c444d85914a4')

package() {
  cd "$srcdir"
  tar -vzxf data.tar.gz
  rm control.tar.gz data.tar.gz debian-binary dmz-cursor-theme_0.4.3_all.deb
  cp -fR * "$pkgdir"
}

# vim:set ts=2 sw=2 et:
