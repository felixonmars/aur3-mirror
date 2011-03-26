# Author: Garth Johnson (growlf@BioCEDE.com) original code by Nick Glynn (exosyst@gmail.com)
# Contributor: Xi0N <grayfox.i0n@gmail.com>
pkgname=gdm2setup
pkgver=0.5.3
pkgrel=3
pkgdesc="A login interface management utility for the new GDM. Allows for wallpaper setting, autologin option, prompted or userlist login, etc."
arch=(any)
url="https://launchpad.net/gdm2setup"
license=(GPL2)
depends=('python2' 'python-imaging' 'gdm>=2.28' 'gksu' 'sudo')
source=("http://pypi.python.org/packages/source/g/gdm2setup/gdm2setup-${pkgver}-karmic.tar.gz")
md5sums=('8df2527f5e85a09a98bea31c774b0e34')

build() {
cd "${srcdir}/${pkgname}-${pkgver}-karmic/"
python2 setup.py install --root=${pkgdir} || return 1
}
