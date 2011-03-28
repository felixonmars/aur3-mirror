# Maintainer: Gergely Imreh <imrehg@gmail.com>

pkgname=django-feedback-pv-git
pkgver=20110328
pkgrel=1
pkgdesc="A reusable django app to add an AJAX "feedback" tab to your Django"
arch=('any')
url="https://github.com/jabapyth/django-feedback/"
license=('GPL')
depends=('python2' 'django')
source=("http://bitbucket.org/ubernostrum/django-registration/downloads/$pkgname-$pkgver-alpha-1.tar.gz")
provides=('django-feedback-pv')
conflicts=('django-feedback-pv')
install="${pkgname}.install"
source=()
md5sums=()

_gitroot="git://github.com/tauberer/django-feedback-pv.git"
_gitname="django-feedback-pv"

build() {
  PYTHON=python2
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d ${srcdir}/${_gitname}-build ] ; then
    rm -r "${srcdir}/${_gitname}-build"
  fi
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  $PYTHON setup.py build
  $PYTHON setup.py install --root=$pkgdir --optimize=1
}
