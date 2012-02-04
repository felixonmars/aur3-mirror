# Maintainer: Laplanche Melvin <melvin.laplanche at gmail dot com>

pkgname=django-subdomains-git
pkgver=20110816
pkgrel=1
pkgdesc="Subdomain tools for the Django framework, including subdomain-specific URL routing."
arch=('any')
url="https://github.com/tkaemming/django-subdomains"
license=('APACHE')
depends=('django')
makedepends=('git')
conflicts=('')
md5sums=()
provides=('django-subdomains')


_gitroot="https://github.com/tkaemming/django-subdomains.git"
_gitname="django-subdomains"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
