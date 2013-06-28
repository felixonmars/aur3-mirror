     # Contributor: Mike Melnikov <make.programs@gmail.com>
    pkgname=qutim-0.3-git
    pkgver=20130628
    pkgrel=1
    pkgdesc="Multiplatform instant messenger. GIT repository. Unstable. /opt installation"
    arch=('i686' 'x86_64')
    url="http://qutim.org"
    license=('GPL')
    depends=('qt4>=4.7' 'openssl' 'libxss' 'qca>=2' 'qca-ossl' 'qtwebkit' 'gnutls' 'zlib' 'attica' 'sdl' 'sdl_mixer' 'cyrus-sasl' 'aspell' 'gsasl')
    makedepends=('gcc' 'make' 'cmake' 'git' 'pkgconfig' 'libpurple')
    conflicts=(qutim-opt-0.3)
    provides=(qutim-opt-0.3)
    replaces=()
    _gitroot="git://github.com/euroelessar/qutim.git"
    _gitname="qutim"
    build() {
      if [ -d $srcdir/$_gitname ]
      then 
            msg "Removing old build directory..."
            rm -fR $srcdir/$_gitname
      fi
            git clone $_gitroot
            cd $_gitname
            git submodule update --init --recursive
		patch < ../../qtdock.patch plugins/docktile/qtdocktile/CMakeLists.txt 
            msg "Building..."
            cmake  -DCMAKE_INSTALL_PREFIX=/opt/qutim-0.3 -DASTRAL=0 -DOFFTHERECORD=0 . || return 1
            make -j1 || return 1
    }

package() {
		cd ${srcdir}/${_gitname}
	    make DESTDIR=${pkgdir} install || return 1
            msg "Ready ..."
}
