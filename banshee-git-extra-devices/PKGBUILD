# Contributor: Manuel Mazzuola <origin.of@gmail.com>
# Contributor: neuromante <lorenzo.nizzi.grifi@gmail.com>

pkgname=banshee-git-extra-devices
pkgver=20110710
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Music management and playback for GNOME - Development w/ Blackberry and Nook Support"
url="http://banshee-project.org/"
license="MIT"
depends=('libxxf86vm' 'mono-addins' 'notify-sharp-svn' 'boo' 'libwebkit' 'gdata-sharp' 'gtk-sharp-beans' 'gudev-sharp' 'gkeyfile-sharp' 'taglib-sharp' 'libmtp' 'libgpod' 'mono-zeroconf' 'gstreamer0.10-base-plugins' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme' 'xdg-utils' 'gconf-sharp')
makedepends=('intltool' 'gnome-doc-utils' 'git')
optdepends=('gstreamer0.10-good-plugins: Extra media codecs'
            'gstreamer0.10-ugly-plugins: Extra media codecs'
            'gstreamer0.10-bad-plugins: Extra media codecs'
            'gstreamer0.10-ffmpeg: Extra media codecs'
            'brasero: CD burning')
options=('!libtool')
install=${pkgname}.install
provides=('banshee')
conflicts=('banshee' 'banshee-1-svn' 'banshee-git')
replaces=('banshee-1-svn')
makedepends=( 'intltool')
source=('0001-Nook-Support.patch' '0002-Blackberry-Support.patch')
md5sums=('5d285c007dbffed09d8ea00496ef1041' 'c58144908be63ff754c3f9b2e4f7c0e8')
#install=banshee.install

_gitroot="git://git.gnome.org/banshee"
_gitname="banshee"

build() {
  export MONO_SHARED_DIR=${srcdir}/.wabi
  mkdir -p "${MONO_SHARED_DIR}"
  cd ${srcdir}
  msg "Connecting to Gnome GIT server...."
  rm  -rf ${srcdir}/${_gitname}-build
  
  if [[ -d ${_gitname} ]]; then
   cd ${_gitname}
   git pull origin
   git submodule init
   git submodule update
    else
   git clone ${_gitroot} ${_gitname}
     fi
  msg " checkout done."
 
  cd ${srcdir}
  git clone ${_gitname} ${_gitname}-build

  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "$MONO_SHARED_DIR"

  cd ${_gitname}-build
  
  #msg "Applying Youtube patch"
  
  git am ../0001-Nook-Support.patch
  git am ../0002-Blackberry-Support.patch
  #patch -p1 -i ../0002-Blackberry-Support.patch

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-docs \
              --disable-static \
              --disable-scrollkeeper \
              --disable-ipod --disable-hal \
              --with-vendor-build-id=ArchLinux
  make
}

package() {
  export MONO_SHARED_DIR="$srcdir/.wabi"
  mkdir -p "$MONO_SHARED_DIR"

  cd ${srcdir}/${_gitname}-build
  
  make DESTDIR="${pkgdir}" install

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
