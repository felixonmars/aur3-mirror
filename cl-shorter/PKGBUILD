# Maintainer: Mike Krueger <info@memoryleakx.dudmail.com>
pkgname=cl-shorter
pkgver=7
pkgrel=2
pkgdesc="Clipboard Link Shorter Icon - This Tool shorten each copied url automatically.  -  like this: http://is.gd/eUzH5A  -  You can control it with a Status Icon (Start | Stop | Exit)"
arch=('i686' 'x86_64')
license=('BSD')
url="https://github.com/memoryleakx/cl-shorter"
depends=('gtk-sharp-2' 'notify-sharp' 'mono')
makedepends=('git')

_gitroot="git://github.com/memoryleakx/cl-shorter.git"
_gitname="cl-shorter"

build() {
  cd $srcdir

  msg "Getting sources"

  cd "${srcdir}"

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/$_gitname

 ./configure --prefix=/usr/local || return 1
  make || return 1
}

package() {

  install -d "$pkgdir"/usr/share/icons/cl_shorter/

  install -Dm755 "$srcdir/$_gitname/CL_Shorter/icon.png" \
      "$pkgdir/usr/share/icons/cl_shorter/icon.png"

  install -Dm644 "$srcdir/$_gitname/CL_Shorter/cl_shorter.desktop" \
      "$pkgdir/usr/share/applications/cl_shorter.desktop"

  cd $srcdir
  cd $_gitname

  make DESTDIR="${pkgdir}" install || return 1

}

