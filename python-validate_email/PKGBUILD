_pkgname="python-validate_email"
pkgname="${_pkgname}"
pkgver="master"
pkgrel=1
pkgdesc="Validate_email verify if an email address is valid and really exists"
arch=('i686' 'x86_64')
url="https://github.com/syrusakbary/validate_email"
license=('LGPL v3')
depends=('python>=3.1' 'python-pydns')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_gitroot="https://github.com/syrusakbary/validate_email.git"
_gitname=("${_pkgname}")

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
}

package(){
  cd ${_gitname}
  python setup.py install --root="$pkgdir" --prefix=/usr
}
