# Contributor: Randy Morris <randy rsontech net>
pkgname=slurpy-git
pkgver=20101104
pkgrel=1
pkgdesc="An AUR search/download/update helper in Python"
arch=('i686' 'x86_64')
url="https://github.com/rson/slurpy"
license=('None')
depends=('python2')
conflicts=('slurpy')
provides=('slurpy')
optdepends=('python2-cjson: faster processing for large result sets'
            'python2-pycurl: upload packages to the AUR from the command line')
makedepends=('git')
source=()
md5sums=()
#_gitroot="/home/oh/projects/slurpy"
_gitroot="git://github.com/rson/slurpy.git"
_gitname="slurpy"
build() {
  msg "Connecting to github.com GIT server...."
 
  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi
  cd $srcdir/$_gitname
  git checkout tmp
 
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
 
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root=${pkgdir} --prefix=/usr
  install -Dm 755 $srcdir/${_gitname}/slurpyrc $pkgdir/etc/slurpyrc
}

