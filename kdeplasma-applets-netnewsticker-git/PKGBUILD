# Maintainer Marcin
pkgname='kdeplasma-applets-netnewsticker-git'
pkgver=20120718
pkgrel=1
pkgdesc="RSS Feed News Ticker. Plasmoid (plasma widget/applet) NetNewsTicker for single line rss news reader"
arch=('i686' 'x86_64')
url='http://netnewsticker.org/'
license=('GPL')
depends=('boost' 'kdepim-runtime' 'kdebase-runtime' 'qt')
makedepends=('git' 'cmake')
optdepends=()
provides=()
conflicts=()
source=()
md5sums=()
_gitroot="git://github.com/christau/netnewsticker.git"
_gitname="netnewsticker"

build()
{
    cd ${srcdir}/

    msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
	cd ${_gitname}
	git pull origin
	msg "The local files are updated..."
    else
	git clone ${_gitroot}
    fi
    
    msg "GIT checkout done."

  msg "Starting make for: ${pkgname}"
  
  if [[ -d ${srcdir}/${_gitname}/build ]]; then
      msg "Cleaning the previous build directory..." 
      rm -rf ${srcdir}/${_gitname}/build     
  fi
    mkdir ${srcdir}/${_gitname}/build
    cd ${srcdir}/${_gitname}/build
      

    msg "Starting cmake..."

    cmake -DCMAKE_INCSTALL_PREFIX=/usr/ -DPLUGIN_INSTALL_DIR=/usr/lib/kde4 -DSERVICES_INSTALL_DIR=/usr/share/kde4/services -DLOCALE_INSTALL_DIR=/usr/share/locale/ -DICON_INSTALL_DIR=/usr/share/icons ../

    make || return 1

    make DESTDIR=${pkgdir} install || return 1

}