# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Maintainer: Gour <gour@gour-nitai.com>
pkgname=south-hg  
pkgver=349
pkgrel=1 
pkgdesc="Intelligent schema migrations for Django applications"
url='http://south.aeracode.org'
arch=('i686' 'x86_64')
license=('Apache')
depends=('python')
makedepends=('setuptools' 'django')
conflicts=('south')
source=()
md5sums=()

_hgroot=http://bitbucket.org/andrewgodwin/
_hgrepo=south

build() {
  cd ${srcdir}

   if [ -d ${_hgrepo}/.hg ]; then
       cd ${_hgrepo}
       hg pull
       hg update -C --rev ${pkgver}
   else
       hg clone ${_hgroot} ${_hgrepo} --rev ${pkgver} || return 1
   fi

   msg "Mercurial checkout done or server timeout"
   msg "Starting building..."

   rm -rf "${srcdir}/${_hgrepo}-build"
   cp -r "${srcdir}/${_hgrepo}" "${srcdir}/${_hgrepo}-build"
   cd "${srcdir}/${_hgrepo}"

   python setup.py install --root=${pkgdir} || return 1
}

