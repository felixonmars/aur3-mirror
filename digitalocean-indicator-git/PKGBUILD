# Maintainer: Pietro Capriata <pietro.capriata@gmail.com>

_pkgname='digitalocean-indicator'
pkgname=$_pkgname-git
pkgrel=1
pkgver=0.2.1.r0.ga2deaf9
pkgdesc='Manage Digital Ocean droplets from your desktop'
arch=('any')
url='https://github.com/andrewsomething/digitalocean-indicator'
license=('GPL')
depends=('python2' 'libappindicator-gtk3' 'python2-digitalocean' 
'libwebkit3' 'gsettings-desktop-schemas')
makedepends=('python2-distutils-extra')
conflicts=('digital-ocean-indicator')
#install=$pkgname.install
md5sums=('SKIP')
source=('git://github.com/andrewsomething/digitalocean-indicator')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"

	python2 setup.py build
}


package() {
cd "${srcdir}/${_pkgname}"

	python2 setup.py install --prefix=/usr --root=${pkgdir}
}

# vim
