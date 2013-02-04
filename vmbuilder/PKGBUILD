# $Id$
# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=vmbuilder
pkgver=0.12.4
pkgrel=1
pkgdesc="Install virtual machines in a snap without ever actually booting a virtual machine"
arch=('any')
url="https://launchpad.net/vmbuilder"
license=('GPL3')
depends=('python2')
source=("https://launchpad.net/vmbuilder/0.12/0.12.4/+download/VMBuilder-${pkgver}.tar.gz")
sha512sums=('6c32f87b7c901516d0c732a9f8d0a665a67e4b8db59f22b6028edd789abf1e2ce19b9cbab6cb531cb868f1431ad68ea7347e41ff803d0fade45120ab18ac2867')

package() {
    cd "${srcdir}/VMBuilder-${pkgver}"
    python2 setup.py install --root="$pkgdir/"
}
