pkgname=gandyn
pkgver=0.1b
pkgrel=1
pkgdesc="Dynamic record update client for the Gandy DNS service."
arch=('any')
url=https://github.com/Chralu/${pkgname}
license=('GPL')
depends=('python>=3')
source=()
md5sums=()
giturl=https://github.com/Chralu/${pkgname}.git
gitdir=${pkgname}

download() {
 cd ${srcdir}
 msg "Connecting to GIT server..."
 git clone --depth=1 ${giturl} ${gitdir}
 cd ${gitdir}
 git checkout ${pkgver} 
 msg "GIT checkout done or server timeout"
}

build() {
  download
  cd ${srcdir}/${gitdir}/src
  python setup.py install --root=${pkgdir}
  cd ../../../
  mkdir ${pkgdir}/etc/
  cp gandyn.conf ${pkgdir}/etc/gandyn.conf.default
  msg "Edit default config file 25/etc/gandyn.conf before running "
  msg "gandyn.py --config /etc/gandyn.conf"
}
