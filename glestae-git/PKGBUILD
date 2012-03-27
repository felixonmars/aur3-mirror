# Maintainer: Kiodo1981 <cristianmartina1981@gmail.com>

pkgname=glestae-git
pkgver=20120327
pkgrel=1
pkgdesc="Glest Advanced Engine"
url="http://sf.net/projects/glestae"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('lua>=5.1' 'mesa' 'libvorbis' 'zlib' 'wxgtk' 'freetype2' "openal" "physfs")
makedepends=('cmake' 'git')


_gitroot=git://glestae.git.sourceforge.net/gitroot/glestae/glestae
_gitname=glestae_git

build() {
	cd "$srcdir"
    msg "Connecting to GIT server...."
    
    if [[ -d "${_gitname}" ]]; then
      cd "${_gitname}" && git pull origin
	  msg "The local files are updated."
    else
	   git clone "${_gitroot}" "${_gitname}"
	fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."


	mkdir -p "${srcdir}/${_gitname}"
	cd "${srcdir}/${_gitname}"

    cmake ${srcdir}/${_gitname}
  	make
}

package() {
	cd "${srcdir}/${_gitname}"

	make DESTDIR=${pkgdir} install
}
