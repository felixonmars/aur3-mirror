# Maintainer:  GunsNRose <3444542 at 163.com>
# Contributor: GunsNRose <3444542 at 163.com>

pkgname=sersync2
pkgver=2.5
pkgrel=1
  

pkgdesc="Synchronize files and folders between servers -using inotiy and rsync with c++."
arch=(i686 x86_64)
url=http://code.google.com/p/sersync
license=('BSDL')
makedepends=('svn' 'gcc' 'curl' 'boost')
depends=('glibc' )
options=('strip')
conflicts=('sersync2-svn')
source=(http://sersync.googlecode.com/files/${pkgname}.5_source.tar.gz)

md5sums=('38e629ea3ca10cd8a6943e89a88c7e0b')
#_svntrunk="http://sersync.googlecode.com/svn/"
#_svnmod="sersync-svn"

build() {
  cd $srcdir/${pkgname} || return 1
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname} || return 1
  cd dist/Release/GNU-Linux-x86/ || return 1
  install -Dm 0755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm 0644 confxml.xml ${pkgdir}/etc/${pkgname}/confxml.xml
}
# vim:set ts=4 sw=4 et sta:
