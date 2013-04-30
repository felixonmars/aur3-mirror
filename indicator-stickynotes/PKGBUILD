# Maintainer: Aaron Abbott <aaron.abbott1@gmail.com>
pkgname=indicator-stickynotes
pkgver=0.4.2
pkgrel=1
_pkgrel_ubuntu=0
pkgdesc="Sticky Notes AppIndicator for Unity Shell and possible other DE's"
arch=('any')
url="https://launchpad.net/indicator-stickynotes"
license=('GPL3')
depends=('python-gobject' 'python3' 'libappindicator3' 'gtksourceview3' )
source=("https://launchpad.net/~umang/+archive/${pkgname}/+files/${pkgname}_${pkgver}-${_pkgrel_ubuntu}~ppa1_all.deb"
	'utf-fix.patch')
md5sums=('9da08631b7b0089de08253a905edb0f7'
         '269a44f5c34cd127a2f3289ecd6f54b0')

build() {
  cd ${srcdir}
  ar x ${pkgname}_${pkgver}-${_pkgrel_ubuntu}~ppa1_all.deb > /dev/null
  tar -xzf data.tar.gz
  # Patch to make indicator-stickynotes run with Arch's Python3 package.
  # Without this patch there is a utf decode error on my computer.
  # Please test without this patch on your system, maybe someone has a better fix?
  patch -p1 < utf-fix.patch
}

package() {
  cd ${srcdir}

  ## autostart desktop file. Comment out this line to not automatically enable it
  cp -R ${srcdir}/etc ${pkgdir}

  cp -R ${srcdir}/opt ${pkgdir}
  cp -R ${srcdir}/usr ${pkgdir} 
}
