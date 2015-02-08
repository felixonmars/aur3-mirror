# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=xhtml-docs
pkgver=1.1
pkgrel=1
pkgdesc="Set of HTML documentation for XHTML 1.1"
arch=('any')
url="http://www.w3.org/TR/xhtml11/"
license=('GPL')
options=('docs')
source=('http://www.w3.org/TR/xhtml11/xhtml11.tgz')
md5sums=('56366fb9ff58b79a2de71f127b9baf76')

package(){  
  install -d ${pkgdir}/usr/share/doc/xhtml
  cp -a ${srcdir}/xhtml11-20101123/* ${pkgdir}/usr/share/doc/xhtml/
}
