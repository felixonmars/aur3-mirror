# Contributor: Mike Melnikov <make.programs@gmail.com>
# Maintainer: Anischenko Alexandr (Dganic) [rus36] <dganic (at) bmail.ru>

pkgname=qutim-0.2.80.00-meta-git
pkgver=20110519
pkgrel=5
pkgdesc="Multiplatform instant messenger. (0.3 beta version) GIT repository. Unstable version for developers."
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL 2')
depends=('qt>=4.7' 'openssl' 'libxss' 'gnutls' 'zlib' 'libidn' 'qca-ossl' 'qca'  'cyrus-sasl' 'cyrus-sasl-plugins' 'attica' 'sdl' 'sdl_mixer' 'aspell' )
makedepends=('gcc' 'make' 'cmake' 'git' 'pkgconfig' 'libpurple')
conflicts=(qutim-0.3-meta-git, qutim-meta-git)
provides=(qutim-0.3-meta-git, qutim-meta-git)
replaces=()
_gitroot="git://github.com/euroelessar/qutim.git"
_gitname="qutim"
build() {
  if [ -d $srcdir/$_gitname ]
  then
	msg "Updating local repository."
	cd $srcdir/$_gitname && git pull
  else
	git clone $_gitroot
	cd $_gitname
  fi
	git submodule update --init --recursive
	git submodule foreach --recursive "git pull origin master"
	[ -d build ] || mkdir build
	cd build
	msg "Creating temporary build directory..."
	cp -r $srcdir/$_gitname $srcdir/$_gitname-build
	cd ${srcdir}/${_gitname}-build/build
	msg "Removing temporary unusable plugin..."
        msg "Building..."
	cmake -DKINETICSCROLLER=false -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=debug .. || return 1
        make -j3 || return 1
	make DESTDIR=${pkgdir} install || return 1
	#-DMOBILEABOUTDIALOG=false -DMOBILECONTACTINFO=false -DMOBILESETTINGSDIALOG=false
	# Add freedesktop compatibility
        install -D -m 664 $srcdir/$_gitname-build/core/share/icons/hicolor/512x512/apps/qutim.png $pkgdir/usr/share/pixmaps/qutim.png || return 1
        install -D -m 664 $srcdir/$_gitname-build/core/share/applications/qutim.desktop $pkgdir/usr/share/applications/qutim.desktop || return 1
	
	msg "Removing build directory..."
	cd ${srcdir}
	rm -Rf ${_gitname}-build
	msg "Ready ;)..."
}

  
