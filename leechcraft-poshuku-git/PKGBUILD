pkgname=leechcraft-poshuku-git
pkgver=20120209
pkgrel=1
pkgdesc="Full-featured WebKit-based web browser for Leechcraft"
arch=('i686' 'x86_64')
url="http://leechcraft.org"
license=('GPL3')
depends=('leechcraft-core-git' 'qjson')
optdepends=()
makedepends=('leechcraft-core-git' 'gcc' 'boost>=1.46' 'make' 'cmake>=2.8.4' 'git')
conflicts=()
provides=()
replaces=()
     
_gitname=leechcraft
_gitroot=git://github.com/0xd34df00d/leechcraft.git
     
     
build() {
cd ${srcdir}
  
msg "Connecting to GIT server...."
if [ -d ${_gitname} ] ; then
cd ${_gitname} && git pull origin
msg "The local files are updated."
cd ${srcdir}
else
git clone ${_gitroot} ${_gitname}
fi
msg "GIT checkout done or server timeout"
 
msg "Starting make..."
  
cd ${srcdir}
rm -rf ${_gitname}-build
mkdir ${_gitname}-build
cd ${_gitname}-build
    
msg "Building ..."
     
msg "Apply ArchLinux hacks for build..."
_git_version=`(cd ${srcdir}/${_gitname} && git describe | awk '{print $1}')`
     
cmake ${srcdir}/${_gitname}/src/plugins/poshuku \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DENABLE_POSHUKU_CLEANWEB=ON \
  -DENABLE_POSHUKU_FATAPE=ON \
  -DENABLE_POSHUKU_FILESCHEME=ON \
  -DENABLE_POSHUKU_FUA=ON \
  -DENABLE_IDN=ON \
  -DENABLE_POSHUKU_KEYWORDS=ON \
  -DENABLE_POSHUKU_ONLINEBOOKMARKS=ON \
  -DENABLE_POSHUKU_POGOOGLUE=ON \
  -DENABLE_POSHUKU_WYFV=ON
   
make DESTDIR=$pkgdir install
     
     
    rm -rf ${_gitname}-build
}

