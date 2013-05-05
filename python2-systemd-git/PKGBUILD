pkgname=python2-systemd-git
_gitname=python-systemd
pkgver=5f531b9
pkgrel=1
pkgdesc="Python2 systemd bindings"
arch=('i686' 'x86_64')
url="https://github.com/systemd/pyton-systemd.git"
license=("APACHE")
depends=('python2'
	 'systemd')
backup=()
makedepends=('git')
optdepends=()
options=()
conflicts=()
provides=()

# makepkg 4.1 knows about git and will pull main branch
source=("git://github.com/systemd/python-systemd.git")

# makepkg knows it's a git repo because the url starts with 'git'
# it then knows to checkout the branch 'pacman41' upon cloning, expediating versioning.
# branch="master"
# source=("git://github.com/systemd/python-systemd.git#branch=$branch")

# makepkg also knows about tags
#tags="v0.8.0"
#source=("git://github.com/systemd/python-systemd.git#tag=$tag")

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
  export USE_SETUPTOOLS=true
  python2 setup.py install --root=${pkgdir}/ --optimize=1
  
  # remove vcs leftovers
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
