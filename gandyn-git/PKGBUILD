pkgname=gandyn-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Dynamic record update client for the Gandy DNS service."
arch=('any')
url=https://github.com/Chralu/gandyn
license=('GPL')
depends=('python>=3')
makedepends=('git')

non_git_pkgname='gandyn'
replaces=("${non_git_pkgname}")
conflicts=("${non_git_pkgname}")
provides=("${non_git_pkgname}")

md5sums=('SKIP'
         '2e9371b9383e10f7ce7eafa05c1149e8')
source=("${pkgname}"::'git+https://github.com/Chralu/gandyn.git'
        'gandyn.conf')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}/src"
  python setup.py install --root=${pkgdir}
  cd ../../../
  mkdir "${pkgdir}/etc/"
  cp gandyn.conf "${pkgdir}/etc/gandyn.conf.default"
  msg "Edit default config file 25/etc/gandyn.conf before running "
  msg "gandyn.py --config /etc/gandyn.conf"
}
