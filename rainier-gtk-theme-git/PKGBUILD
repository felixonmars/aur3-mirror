# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]com>

pkgname=rainier-gtk-theme-git
pkgver=10.b4808d4
pkgrel=1
pkgdesc="A nice, simple theme specially modified for Trenta OS."
arch=('any')
url="http://trentaos.org/"
license=('GPLv3')
depends=('gtk3' 'gtk-engine-murrine')
makedepends=('git')
provides=('')
source=("rainier-gtk"::'git+https://github.com/trenta-os/rainier-gtk.git')
sha256sums=('SKIP')
_realname=rainier-gtk

pkgver() {
  cd "${_realname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
    
  package() {
  cd "$srcdir/${_realname}"
  install -dm755 "${pkgdir}/usr/share/themes/"
  rm -rf {.git,LICENSE,README.md}
  cp -dpr --no-preserve=ownership "${srcdir}/${_realname}" "${pkgdir}/usr/share/themes/"
}
            
