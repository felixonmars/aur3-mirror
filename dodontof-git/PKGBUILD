pkgname=dodontof-git
pkgver=20120107
pkgrel=1
epoch=
pkgdesc="DodontoF is online RPG session site, Anyone can use."
arch=('any')
url="http://www.dodontof.com/"
license=('GPL')
groups=()
depends=('ruby' 'apache')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=('dodontof')
replaces=()
backup=()
options=()
install=
changelog=
source=(DodontoFServer.patch
        WebCameraCaptureImageUploader.patch
        src_ruby_config.patch
        )
noextract=()

md5sums=('c67b0e7ab390413a742f54ed9b7c6754'
         'd95cdcc3576810b7b3d039d70239c200'
         'e69d8bd07e41e08144dab2786fde2ad1')

_gitroot="git://github.com/torgtaitai/DodontoF.git"
_gitname="DodontoF"

build() {
  mkdir -p ${pkgdir}/srv/http
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
  patch -p0 $srcdir/$_gitname/DodontoFServer.rb < DodontoFServer.patch
  patch -p0 $srcdir/$_gitname/WebCameraCaptureImageUploader.rb < WebCameraCaptureImageUploader.patch
  patch -p0 $srcdir/$_gitname/src_ruby/config.rb < src_ruby_config.patch
  cd "$srcdir/$_gitname"
  chmod 755 DodontoFServer.rb WebCameraCaptureImageUploader.rb saveData imageUploadSpace imageUploadSpace/smallImages saveDataTempSpace fileUploadSpace replayDataUploadSpace
  chmod 666 log.txt log.txt.0
  cd ..
  mv $_gitname/saveData .
  mv $_gitname/imageUploadSpace .
  mv $_gitname ${pkgdir}/srv/http/$_gitname
  mv imageUploadSpace ${pkgdir}/srv/http/imageUploadSpace
  mv saveData ${pkgdir}/srv/saveData
  chown -R http:http ${pkgdir}/srv/http/DodontoF ${pkgdir}/srv/http/imageUploadSpace ${pkgdir}/srv/saveData
}

# vim:set ts=2 sw=2 et:
