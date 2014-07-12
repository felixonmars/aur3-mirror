pkgname=bokken-git
pkgver=20140711.1.0318d5c
pkgrel=1
pkgdesc="GUI for radare2 and pyew"
arch=('any')
url="http://inguma.eu/projects/bokken"
license=('GPL')
depends=('python2'
         'pygtksourceview2'
         'graphviz')
optdeps=('pyew: For pyew backend support'
         'r2-bindings: For r2 backend support (stable)'
				 'radare2-bindings-git: For r2 backend support (devel)')
makedepends=('git')
conflicts=('bokken-hg')
options=('!strip')
source=("${pkgname}"::"git://github.com/radare/bokken.git")
md5sums=('SKIP')

pkgver () {
	cd "${srcdir}/${pkgname}"
	_date=`date +"%Y%m%d"`
	echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}

package() {
  install -d -m755 ${pkgdir}/usr/share/bokken/ui
  cp -r ${srcdir}/${pkgname}/ui ${pkgdir}/usr/share/bokken/
  install -m755 ${srcdir}/${pkgname}/bokken ${pkgdir}/usr/share/bokken/bokken
  install -m755 ${srcdir}/${pkgname}/bokken.py ${pkgdir}/usr/share/bokken/bokken.py

  install -d ${pkgdir}/usr/bin/
  cat > ${pkgdir}/usr/bin/bokken << 'EOF'
#!/bin/bash
cd /usr/share/bokken/
exec ./bokken "$@"
EOF
  chmod +x ${pkgdir}/usr/bin/bokken
}
