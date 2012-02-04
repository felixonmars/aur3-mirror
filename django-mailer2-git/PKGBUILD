# Contributor: morakh
pkgname=django-mailer2-git
pkgver=20111123
pkgrel=1
pkgdesc="A reusable Django app for queuing the sending of email by Chris Beaven (a fork of James Tauber's django-mailer)"
arch=('any')
url="https://github.com/SmileyChris/django-mailer-2"
license=('MIT')
depends=('python' 'django')
makedepends=('git')
conflicts=('django-mailer')
provides=('django-mailer2')
source=()
md5sums=()

_gitname="django-mailer-2"
_gitroot="https://github.com/SmileyChris/django-mailer-2.git"
build() {
  cd $startdir/src
  
  msg "Connecting to GIT server..."
  
  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi
  msg "GIT checkout done or server timeout"

  python setup.py install --root=$pkgdir/
}
