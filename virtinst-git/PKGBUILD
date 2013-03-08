# Maintainer: Patryk 

pkgname=virtinst-git
pkgver=20130308
pkgrel=1
pkgdesc="A command line tool which provides an easy way to provision operating systems into virtual machines."
makedepends=('git')
depends=('python2' 'libvirt' 'urlgrabber')
url="http://virt-manager.et.redhat.com"
arch=('any')
license=('GPL')
conflicts=('virtinst')
provides=('virtinst')

_gitroot=git://git.fedorahosted.org/git/python-virtinst.git
_gitname=virtinst

build() {
  cd $srcdir/

  cd $srcdir

  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname-build"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd $_gitname-build
  python2 ./setup.py build

}

package() {
  cd "$srcdir/$_gitname-build"

  python2 ./setup.py install --root=$pkgdir
}
