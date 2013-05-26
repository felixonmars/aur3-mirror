# Maintainer: Abelardo Ricart <aricart@gmail.com>
# Contributor: parsiad
# 

pkgname='wxmupen64plus-hg'
pkgver=549.d8469164f827
pkgrel=1
pkgdesc='An experimental Mupen64Plus frontend written with wxWidgets'
url='https://bitbucket.org/auria/wxmupen64plus/'
depends=('wxgtk2.9' 'sdl')
conflicts=('wxmupen64plus')
provides=('wxmupen64plus')
makedepends=('mercurial' 'python' 'mupen64plus-core-hg')
source=(
  'hg+https://bitbucket.org/auria/wxmupen64plus'
  'wxmupen64plus.desktop')
md5sums=('SKIP' 'abe57a02b9366b63b83967f94bc3dc5c')
arch=('i686' 'x86_64')
license=('GPL')

pkgver() {
  cd "${srcdir}/wxmupen64plus"
  echo $(hg identify -n).$(hg identify -i)
}

build()
{
	cd "${srcdir}/wxmupen64plus"
	
	#Version check is false because we have the package manager to do that for us. 
	./waf --mupenapi="/usr/include/mupen64plus" \
	      --wxconfig="/usr/bin/wx-config-2.9" \
	      --libdir="/usr/lib" \
	      --pluginsdir="/usr/lib/mupen64plus" \
	      --prefix="${pkgdir}/usr" \
	      --version_check=false \
	      configure
	./waf
}

package()
{
	cd "${srcdir}/wxmupen64plus"
	./waf install

	install -Dm644 "${srcdir}/wxmupen64plus/License.txt" "${pkgdir}/usr/share/licenses/wxmupen64plus/LICENSE"
	install -Dm644 "${srcdir}/wxmupen64plus.desktop" "${pkgdir}/usr/share/applications/wxmupen64plus.desktop"
}

