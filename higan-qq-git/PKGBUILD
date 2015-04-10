pkgname=higan-qq-git
pkgver=094.8d4b3cf
pkgrel=1
pkgdesc="A Nintendo multi-system emulator with quequotion's customizations"
arch=('i686' 'x86_64')
url=http://byuu.org/higan/
license=(GPL)
conflicts=('higan' 'bsnes')
provides=(higan{,-qq}{,-git})
makedepend=('libao')
depends=('openal' 'libgl')
optdepends=('alsa' 'pulseaudio' 'sdl')
source=('higan::git+https://github.com/quequotion/higan-qq.git'
	'profilebatch'
        'mercury.patch')
install=higan.install
_profile="accuracyfast" 
md5sums=('SKIP'
         '42cf726affe08829b13e843b8d8ae682'
         '6ce8b7fef6432184d50124e26991a374')
 
pkgver() {
        cd "higan"
        echo 094.$( git describe --always | sed 's#-#_#g;s#v##' )
}
 
prepare(){
        cd "${srcdir}/higan"
        #Check out a specific commit (rollback)
        #git checkout 4e2eb23
        #Local patches (testing before adding to git)
        #patch -Np1 < "${srcdir}/mercury.patch"
        #Append user's CXXFLAGS and LDFLAGS
        sed -i "\|^flags += -I. -O3 -fomit-frame-pointer| s|$| -std=gnu++11 $CXXFLAGS|" Makefile
        sed -i "\|^link +=| s|$| $LDFLAGS|" Makefile
}
 
build(){
# libananke
        cd "${srcdir}/higan"
        make \
        compiler=g++ \
        platform=linux \
        -C ananke
 
# higan
        cd "${srcdir}/higan"
        make clean
        # Normal build
        make \
        compiler=g++ \
        platform=linux \
        target=higan \
        profile=${_profile} \
        name=higan-${_profile}

        # Profile Guided Optimization build
        #
        # Build with profile generation
        #make pgo=instrument compiler=g++ platform=linux target=higan profile=${_profile} name=higan-${_profile}
        #
        # Run all cores and SFC special chips (except the new (famicom variant) nSide systems (Playchoice 10, VS System))
        #"${srcdir}/profilebatch" "out/higan-${_profile}" "/path/to/your/higan/library"
        #
        # Build with profile analysis
        #make clean
        #make pgo=optimize compiler=g++ platform=linux target=higan profile=${_profile} name=higan-${_profile}
}
 
package(){
# Install higan
        cd "${srcdir}/higan"

# libananke
	#if [ ! -d ~/.config/ananke ]; then install -d ~/.config/ananke; fi
	echo ${pkgdir}
        make DESTDIR=${pkgdir} prefix=/usr/lib/ -C ananke install

# higan
	echo ${pkgdir}
        make DESTDIR=${pkgdir} prefix=/usr/ name=higan-${_profile} install
}

