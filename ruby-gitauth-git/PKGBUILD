# Contributor: Markus M. May <mmay AT javafreedom DOT org>
pkgname=ruby-gitauth-git
pkgver=20091110
pkgrel=1
pkgdesc="SSH-based authentication for Shared Git Repositories."
url="http://github.com/brownbeagle/gitauth"
arch=(any)
license=('AGPL')
depends=('ruby>=1.8.6')

makedepends=('git')	
conflicts=('ruby-gitauth')
provides=('ruby-gitauth')
options=(!strip !docs)
install=gitauth.install
source=()
md5sums=()

_gitroot=git://github.com/brownbeagle/gitauth.git
_gitname=gitauth

build() {
    cd $srcdir
 
    msg "Connecting to github.com GIT server...."
    
    if [ -d $srcdir/$_gitname ] ; then
        # update local system
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        # clone git repository
        git clone $_gitroot
        cd $_gitname
    fi

    msg "Installing submodules"      
    # initialize sub modules
    git submodule init
    git submodule update

    msg "Installing files"
    mkdir -p $pkgdir/opt/$_gitname
    cp -r --preserve=all $srcdir/$_gitname $pkgdir/opt

}
