# $Id: PKGBUILD 97079 2013-09-12 10:16:35Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>
# Contributor: Preston M.<pentie at gmail dot com>

pkgname=virt-manager-lite
_pkgname=virt-manager
pkgver=1.0.1
pkgrel=3
pkgdesc="Virt-manager commandline tools with lightweight dependency (virt-install virt-image virt-convert virt-clone)"
arch=('any')
url="http://virt-manager.et.redhat.com"
license=('GPL')
depends=('libvirt' 'libvirt-python' 'libxml2' 'python2' 'openbsd-netcat' 'urlgrabber')
makedepends=('python2')
conflicts=('virtinst' 'virt-manager')
replaces=('virtinst' 'virt-manager')
install=virt-manager.install
source=("https://fedorahosted.org/released/virt-manager/$_pkgname-$pkgver.tar.gz")

md5sums=('4741c0d93d69cef5f936b2ea2d8348c5')


prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i '/self._build_icons/d;/self.run_command("build_i18n")/d' setup.py # no need building ui things
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root "$pkgdir"
  rm "$pkgdir/usr/bin/virt-manager" #not working anyway.
}

# vim:set ts=2 sw=2 et:
