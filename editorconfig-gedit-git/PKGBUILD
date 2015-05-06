# Maintainer: Dylan Smith <dyskette at gmail dot com>
# Contributor: Wolfgang Faust <wolfgangmcq@gmail.com>
# Contributor: Carlos Ruiz-Henestrosa <ruizh.cj@gmail.com>

_basename=editorconfig-gedit
pkgname=$_basename-git
pkgver=0.5.3.r3.gcd097ca
pkgrel=1
pkgdesc="EditorConfig plugin for gedit"
arch=('any')
url="http://editorconfig.org"
license=('GPL')
groups=()
depends=('gedit' 'python-editorconfig-core')
makedepends=('git')
provides=("$_basename")
conflicts=("$_basename")
options=()

source=("$pkgname"::"git://github.com/editorconfig/$_basename.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  installdir=$pkgdir/usr/lib/gedit/plugins
  mkdir -p $installdir
  cp -r $srcdir/$pkgname/editorconfig_plugin/ $installdir
  cp $srcdir/$pkgname/editorconfig.plugin $installdir
  cp $srcdir/$pkgname/editorconfig_gedit3.py $installdir
  sed -i 's/python/python3/;' "$installdir/editorconfig.plugin"
}

# vim:set ts=2 sw=2 et:
