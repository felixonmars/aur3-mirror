pkgname=leechcraft-core-git
pkgver=20120314
pkgrel=1
pkgdesc="Free open source cross-platform modular internet-client."
arch=('i686' 'x86_64')
url="http://leechcraft.org"
license=('GPL3')
depends=('qt>=4.7' 'sqlite3' 'boost-libs>=1.46')
optdepends=('mysql: MySQL support' 'postgresql: PostgreSQL support')
makedepends=('gcc' 'boost>=1.46' 'make' 'cmake>=2.8.4' 'git')
conflicts=('leechcraft' 'leechcraft-git')
provides=(leechcraft)
replaces=('leechcraft' 'leechcraft-git')
install=leechcraft.install
     
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
     
cmake ${srcdir}/${_gitname}/src \
  -DLEECHCRAFT_VERSION="${_git_version}" \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DWITH_PLUGINS=False
   
make DESTDIR=$pkgdir install
     
install -Dm 644 $srcdir/${_gitname}/src/resources/images/leechcraft.svg \
                $pkgdir/usr/share/pixmaps/leechcraft.svg
     
     
install -Dm 644 $srcdir/${_gitname}/src/freedesktop/leechcraft.desktop \
                $pkgdir/usr/share/applications/leechcraft.desktop || return 1
     
    rm -rf ${_gitname}-build
}

