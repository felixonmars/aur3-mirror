# Maintainer: Bence Horváth (Twl) - <horvathb@me.com>

pkgname=mangos
pkgver=12532
_fullver="364a772a504a2a5db7ec1bc9ec36c70fee54f65e"
_scriptsver="91971b329a8eb34bb750cf554f010e299885b8e9"
pkgrel=1
pkgdesc="The project is a full featured World of Warcraft server suite, including servers for authentication, client updates, world content serving, and battlegrounds. Additional features include tools to build and develop game content"
arch=('x86_64' 'i686')
url="http://getmangos.com"
license=('GPL')
depends=('mysql' 'openssl' 'libmysqlclient' 'mysql-clients' 'zlib')
makedepends=('git' 'libtool' 'patch' 'gcc' 'make' 'autoconf' 'automake' 'bin86' 'bison' 'ed' 'fakeroot' 'flex' 'm4' 'pkgconfig' 'ace')
options=('!libtool')
source=("https://github.com/mangostwo/server/archive/${_fullver}.zip" 
"https://github.com/mangostwo/scripts/archive/${_scriptsver}.zip")
sha512sums=('1b4af6449c8b031759f66bf9891d6909bf41f334e47710a83e7cc2ffe254e24c5bc057efa69d5a827f3f4d2a172b1a536c006ae03e075a95560edeeb9b1639b2'
 '9d3c76d4658d687e3f577510653be71282ee182a131cee84078e1dafcaccc3df8ef06d9d587f153ddd6b77dd588e0e50737cb78886f613a98b37183ce4f54517')
conflicts=(mangos-git)

prepare()
{
    cd "${srcdir}/server-${_fullver}"
    
    # enable scripts
    rm -fr "${srcdir}/server-${_fullver}/src/bindings/scripts"
    mkdir "${srcdir}/server-${_fullver}/src/bindings/scripts"
    cp -a "${srcdir}/scripts-${_scriptsver}"/* "${srcdir}/server-${_fullver}/src/bindings/scripts"
    sed -i 's/#[[:space:]]*\(add_subdirectory(scripts)\)/\1/g' src/bindings/CMakeLists.txt
}

build() 
{   
    cd "${srcdir}/server-${_fullver}"
    rm -fr obj
    mkdir obj && cd obj
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DACE_USE_EXTERNAL=ON
    make
} 

package()
{
    cd "${srcdir}/server-${_fullver}/obj"
    make DESTDIR="${pkgdir}/" install
}
