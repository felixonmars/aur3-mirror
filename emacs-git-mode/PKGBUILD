# Contributor: yescalona <yescalona[at]ug[dot]uchile[dot]cl>

pkgname=emacs-git-mode
pkgver=1.7.3.3
pkgrel=1
pkgdesc='Emacs git-mode'
arch=('i686' 'x86_64')
url='http://git.or.cz/'
license=('GPL2')
makedepends=('emacs')
depends=('emacs' 'git-core')
replaces=('git-mode')
provides=('')
install=${pkgname}.install
source=("http://kernel.org/pub/software/scm/git/${pkgname:6:3}-${pkgver}.tar.bz2")
md5sums=('0430440eeb7c037afd4254bc6fd2cce8')

build() {
  cd "${srcdir}/${pkgname:6:3}-${pkgver}/contrib/emacs"
  make 
  make DESTDIR="${pkgdir}" prefix=/usr install
}
