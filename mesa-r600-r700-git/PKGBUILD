# Maintainer: andrewthomas <atswartz at gmail.com>
# Contributor: endlessroad1991 <385989829@qq.com>

_pkgext=-r600-r700-git
pkgname=mesa$_pkgext

pkgver=20111222
_realver=7.11
pkgrel=1
pkgdesc="Full Mesa 3D graphics library with all its components, **ONLY** for ati r6xx/r7xx video cards, built from the git master branch."
arch=('i686' 'x86_64')
makedepends=('glproto>=1.4.12' 'pkgconfig' 'libdrm>=2.4.24' 'libxxf86vm>=1.1.0' 'libxdamage>=1.1.3' 'expat>=2.0.1' 'libx11>=1.3.5' 'libxt>=1.0.8' 
             'gcc-libs>=4.5' 'dri2proto=2.3' 'python2' 'talloc' 'libxml2' 'imake' 'git' 'pkgconfig')
url="http://mesa3d.org/"
license=('custom')
source=(LICENSE)
provides=("libgl=${_realver}" "mesa-full" "mesa-git" "mesa=${_realver}" "glut=${_realver}" "freeglut" "ati-dri=${_realver}")
replaces=('libgl' 'mesa-full' 'mesa-git' 'mesa' 'glut' 'freeglut' 'ati-dri')
conflicts=('libgl' 'mesa-full' 'mesa-git' 'mesa' 'glut' 'freeglut' 'ati-dri')
md5sums=('5c65a0fe315dd347e09b1f2826a1df5a')

_gitroot="git://anongit.freedesktop.org/git/mesa/mesa"
_gitname="mesa"

build() {
	msg "Connecting to git.freedesktop.org GIT server...."

	if [ -d "${srcdir}"/$_gitname ] ; then
		cd $_gitname && git fetch && git reset --hard origin/master
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "${srcdir}"/$_gitname-build
	cp -rH "${srcdir}"/$_gitname "${srcdir}"/$_gitname-build
	cd "${srcdir}"/$_gitname-build	
	
	# python2 build fixes
	sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
	-e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $(find $srcdir -name '*.py')
	sed -i -e "s|PYTHON2 = python|PYTHON2 = python2|" "${srcdir}"/$_gitname-build/configs/{default,autoconf.in}
        sed -i -e "s|python|python2|" "${srcdir}"/$_gitname-build/src/gallium/auxiliary/Makefile

./autogen.sh --prefix=/usr \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=r600,swrast \
    --enable-glx-tls \
    --with-driver=dri \
    --disable-gles1 \
    --disable-gles2 \
    --enable-xcb \
    --enable-glut \
    --disable-egl \
    --disable-gallium-egl || return 1

    make || return 1
    make DESTDIR="${pkgdir}" install || return 1


	install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
	ln -sf libglx.xorg ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so || return 1

	install -m755 -d "${pkgdir}/usr/bin"
        install -m755 -d "${pkgdir}/usr/share/licenses/mesa"
        install -m755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}

