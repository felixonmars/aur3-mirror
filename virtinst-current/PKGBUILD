# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: kvasthval <aur@fjerhammer.dk>

pkgname=virtinst-current
_basename=virtinst
pkgver=0.600.4
pkgrel=1
pkgdesc="A command line tool which provides an easy way to provision operating systems into virtual machines."
depends=('python2' 'libvirt' 'urlgrabber')
provides=('virtinst')
conflicts=('virtinst')
url="http://virt-manager.et.redhat.com"
arch=('any')
license=('GPL')
source=("http://virt-manager.et.redhat.com/download/sources/$_basename/$_basename-$pkgver.tar.gz")
md5sums=('0be36b08bb8b61eb9d75f0885eacc173')

build() {
  cd $srcdir/$_basename-$pkgver
  python2 ./setup.py build
}

package() {
  cd $srcdir/$_basename-$pkgver
  python2 ./setup.py install --root=$pkgdir
}
