# Contributor: Anton Kalugin aka Strafer  <strafer at ufaley dot su>
 
pkgname=vimprobable-git
pkgver=20110829
pkgrel=1
pkgdesc="WWW browser that behaves like the Vimperator plugin available for Mozilla Firefox. It is based on the WebKit engine (using GTK bindings). It is a fork of the currently abandoned vimpression (former webkitbrowser)."
arch=('i686' 'x86_64')
url="http://vimprobable.org/"
license=('mit')
depends=('libwebkit>=1.1.11 gtk2 libsoup')
makedepends=('git')
 
_gitroot="git://git.code.sf.net/p/vimprobable/code"
_gitname="code"
_gitbranch="vimprobable1"
 
build() {
		cd ${srcdir}
 
		msg "Connecting to GIT server..."
 
		if [ -d ${_gitname} ]; then
				cd ${_gitname} && git pull origin ${_gitbranch}
				cd ..
				msg "The local files are updated."
		else
				git clone -b ${_gitbranch} ${_gitroot}
		fi
 
		msg "GIT checkout done or server timeout"
 
		msg "Removing old build directory..."
		rm -rf ${srcdir}/${_gitname}-build
		msg "Creating build directory..."
		cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
 
		msg "Starting make..."
 
		cd ${_gitname}-build
 
		[[ ! -e ${startdir}/config.h ]] && msg "If you want to configure vimprobable — copy file \"config.h\" from build directory to ${startdir}/ and edit it"
		[[ -e ${startdir}/config.h ]] && msg "Using your config.h" && cp -r ${startdir}/config.h config.h
 
		make || return 1
 
		make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="${pkgdir}" install || return 1
		mkdir -p  "${pkgdir}/usr/share/licenses/${pkgname}/"
		chmod 0755  "${pkgdir}/usr/share/licenses/${pkgname}/"
		install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

