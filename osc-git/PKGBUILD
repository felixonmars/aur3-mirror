pkgname=osc-git
_gitname="osc"
pkgver=0.145.0.6.gc398cb3
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
url="http://build.opensuse.org"
license=("GPL")
depends=('python2' 'urlgrabber' 'python2-m2crypto')
makedepends=('git' 'python2')
arch=('any')
Provides=('osc')

# makepkg 4.1 knows about git and will pull main branch
source=("git://github.com/openSUSE/osc.git")

# because the sources are not static, skip checksums
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed 's/-/./g')
  # for git, if the repo has no tags, comment out the above and uncomment the next line:
  #echo "0.$(git rev-list --count $branch).$(git describe --always)"
  # This will give you a count of the total commits and the hash of the commit you are on.
  # Useful if you're making a repository with git packages so that they can have sequential
  # version numbers. (Else a pacman -Syu may not update the package)
}

#build() {
#  cd "${srcdir}/${_gitname}"
#  python2 setup.py build 
   # no need to build setup.py install will do this
#}

package() {
  cd "${srcdir}/${_gitname}"

  python2 setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1
  
  cd $pkgdir/usr/bin
  ln -s osc-wrapper.py osc

  # remove vcs leftovers  
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
