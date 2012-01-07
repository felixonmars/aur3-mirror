# Maintainer: Yann Kaiser <kaiser.yann@gmail.com>
# Contributor: Yochai Gal <yochaigal@gmail.com>
pkgname=gsb
pkgver=1.56.0
_pkgver=1324679796
pkgrel=2
pkgdesc="A tower-defense-like space battle simulator"
arch=('i686' 'x86_64')
url="http://positech.co.uk/gratuitousspacebattles/"
license=('custom')
depends=('bzip2' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'libidn' 'libxft' 'zlib')
makedepends=()
source=('gsb.desktop' 'icon.png')
md5sums=('a3bde1e1e47b40e5a292f21cd0c49b7d'
         '29edd682bbf28e72a39be7f7129977c2')

_archive_name="GSB"
_archive_md5="221add4aefd4da39e965b987b9f57fb5"

_archive="gsb${_pkgver}.tar.gz"

build() {
  cd ${srcdir}

if [ ! -f ${_gsbarchivelocation}${_archive} ]; then
	 if [ ! -f ${_archive} ] && [ -n "${_humblebundle4key}" ]; then
		rm -f ${_archive}* index.html\?key\=${_humblebundle4key}*
        	wget http://www.humblebundle.com/?key=${_humblebundle4key}
	        wget $(cat index.html\?key\=${_humblebundle4key} | grep "${_archive}" | cut -d "'" -f 10)
	        mv ${_archive}* ${_archive}
	  elif [ -z "${_humblebundle4key}" ]; then
	        echo You can now automate the download of the archive using the _humblebundle4key bash variable.
	        echo Just add \'export _humblebundle4key\=\<Your key here\>\' to \.bashrc
	        echo
	        echo Otherwise please just place ${_archive} into $(pwd)/
	        echo Press Enter to continue
	        read -a _unused
	  fi
  fi
  if [ ! -f ${_gsbarchivelocation}${_archive} ]; then
    echo "${_gsbarchivelocation}${_archive} not found!"
    return 1
  fi

  if ! echo "${_archive_md5}  ${_gsbarchivelocation}${_archive}" | md5sum -c --quiet; then
    echo "Invalid checksum for ${_gsbarchivelocation}${_archive}"
    return 1
  fi

  bsdtar -xf ${_gsbarchivelocation}${_archive}

  cd ${srcdir}/${_archive_name}
  if test "${CARCH}" == "i686"; then
    rm GSB.bin.x86_64
    mv GSB.bin.x86 GSB
    rm -R lib64
    #rm lib/lib{ogg,openal,SDL-1.2,SDL_image-1.2,vorbisfile,vorbis}.so.*
  else
    rm GSB.bin.x86
    mv GSB.bin.x86_64 GSB
    rm -R lib
    #rm lib64/lib{ogg,openal,SDL-1.2,SDL_image-1.2,vorbisfile,vorbis}.so.*
  fi

  mkdir -p ${pkgdir}/opt/ ${pkgdir}/usr/bin/ \
    ${pkgdir}/usr/share/applications
  cp -r ${srcdir}/${_archive_name} ${pkgdir}/opt/
  cp ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  cp ${srcdir}/icon.png ${pkgdir}/opt/${_archive_name}/
  ln -s /opt/${_archive_name}/${_archive_name} \
    ${pkgdir}/usr/bin/${pkgname}
  chmod a+r ${pkgdir}/usr/share/applications/${pkgname}.desktop \
    ${pkgdir}/opt/${_archive_name}/icon.png
}

# vim: et ts=2 sw=2 sts=2
