pkgname=ogglify
pkgver=20130321
pkgrel=1
pkgdesc="Performs conversion from .mp3, .flac, and similar file types to .ogg and embeds them. Designed to replace oggchan."
arch=('i686' 'x86_64')
url="http://dnsev.github.com/4cs/"
license=('unknown:unknown')
depends=('ffmpeg' 'libstdc++5')
makedepends=('gcc-multilib' 'git')
changelog=${pkgname}.changelog
source=('embed.cpp-patch')
md5sums=('0c7a253969b96f67090ad46a66f65944')

_gitroot="git://github.com/dnsev/4cs.git"
_gitname="4cs"

build() {
  if [ -d ${srcdir}/${_gitname}/.git ] ; then
		(
			cd ${srcdir}/${_gitname} && \
				git checkout master && \
				git pull origin master
		)
		msg "The local files are updated."
	else
		( git clone ${_gitroot} ${_gitname} )
	fi
	msg "GIT checkout done or server timeout"

  	cd $srcdir/${_gitname}/ogglify/src
  	g++ -o ${pkgname} SoundEmbedder.cpp

  	cd ../../cpp/
  	mkdir -p ./obj/{ImgLib,LodePNG,Random,stb_image} || return 0
  	cd src/
  	rm JPEG/jpgd.o
  	patch -uN Embed.cpp ${srcdir}/embed.cpp-patch
  	cd ../
  	make

}

package() {
  install -Dm755 ${srcdir}/${_gitname}/${pkgname}/src/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 ${srcdir}/${_gitname}/cpp/extract ${pkgdir}/usr/bin/${pkgname}-extract
  install -Dm644 ${srcdir}/${_gitname}/readme.md ${pkgdir}/usr/share/doc/${pkgname}/README
}
