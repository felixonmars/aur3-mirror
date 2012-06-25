pkgname=chiliproject-git
pkgver=20120626
pkgrel=2
pkgdesc="Chiliproject is a fork of Redmine, a flexible project management web application written using Ruby on Rails."
arch=('any')
url="https://www.chiliproject.org"
license=('GPL2')
depends=('ruby' 'ruby-bundler' 'mysql' 'libxml2' 'libxslt' 'imagemagick' 'pkg-config')
provides=('chiliproject')
conflicts=('chiliproject')
backup=('var/lib/chiliproject/config/database.yml'
       'var/lib/chiliproject/config/configuration.yml')
makedepends=('glibc' 'git')
optdepends=('git: Git repository browsing'
            'subversion>=1.3.0: Subversion repository browsing'
            'darcs: Darcs repository browsing'
            'bzr: Bazaar repository browsing'
            'mercurial: Mercurial repository browsing')
options=()
install=chiliproject.install

_gitroot="git://github.com/chiliproject/chiliproject.git"
_gitname="chiliproject"

build() {
    return 0
}

package() {
    cd "$srcdir"
    msg "Connecting to GIT server..."
    if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
    else
      git clone --depth=1 $_gitroot $_gitname
      cd $_gitname
    fi
    msg "GIT checkout done or server timeout"

    # remove git dir
    rm $(find "$srcdir" -type d -name ".git") -rf

    # install in /var/lib
    _instdir="$pkgdir/var/lib/chiliproject"
    mkdir -p ${_instdir}
    cp -ra . ${_instdir}

    # create required directories
    mkdir -p "${_instdir}/public/plugin_assets"
}

# vim:set ts=4 sw=4 et:
