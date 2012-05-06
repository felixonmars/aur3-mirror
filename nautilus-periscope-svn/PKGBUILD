# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=nautilus-periscope-svn
pkgver=r152
pkgrel=2
pkgdesc="Integration of Periscope in Nautilus menus."
arch=(any)
url="http://code.google.com/p/periscope"
license=(LGPL)
depends=('periscope' 'python-nautilus' 'pyxdg')
changelog=Changelog
provides=(${pkgname})
conflicts=(${pkgname})
source=("http://periscope.googlecode.com/svn-history/${pkgver}/trunk/bin/periscope-nautilus/periscope-nautilus.py")
md5sums=('cd119b9874d8f8d48f8c0d82272c03b3')

package() {
  install -Dm755 "${srcdir}/periscope-nautilus.py" "${pkgdir}/usr/share/nautilus-python/extensions/periscope-nautilus.py"
}
