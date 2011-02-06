# Contributor: Charles Clement <caratorn@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Maintainer: Laszlo Papp <djszapi2@gmail.com>
pkgname=bitbake
pkgver=1.10.2
pkgrel=1
pkgdesc="A simple tool for task execution derived from Gentoo's portage"
arch=('any')
url="http://developer.berlios.de/projects/bitbake/"
license=('GPL' 'custom:MIT')
depends=('python2' 'setuptools')
source=(http://download.berlios.de/bitbake/${pkgname}-${pkgver}.tar.gz)
md5sums=('ec2e04991a0bb4956780d1974514c033')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  # Install vim extensions
  VIMRUNTIME="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 contrib/vim/ftdetect/bitbake.vim \
    "${VIMRUNTIME}/ftdetect/bitbake.vim"
  install -D -m644 contrib/vim/syntax/bitbake.vim \
    "${VIMRUNTIME}/syntax/bitbake.vim"
  
  install -D -m644 contrib/bbdev.sh ${pkgdir}/usr/share/bitbake/bbdev.sh

  # Handle MIT license
  install -D -m644 doc/COPYING.MIT \
    ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
