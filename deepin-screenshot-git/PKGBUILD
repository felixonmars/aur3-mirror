# Contributor: skatiger <skatiger [at] gmail [dot] com> 

pkgname=deepin-screenshot-git
pkgver=20120503 # git auto added
pkgrel=1
pkgdesc="a screen snapshot tool from deepin linux"
arch=("i686" "x86_64")
url="http://www.linuxdeepin.com"
license=("LGPLv3")
depends=('python2' 'gconf' 'pygtk' 'python-xlib')
makedepends=('git')
conflicts=('deepin-scrot')
install=deepin-screenshot.install

_gitroot="git://github.com/lovesnow/deepin-screenshot.git"
_gitname="deepin-screenshot"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}

    # Change remote url to anongit
    if [ -z $( git branch -v | grep anongit ) ] ; then
        git remote set-url origin ${_gitroot}
    fi
    
    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  rm -rf "$srcdir/${_gitname}-build"
  git clone "$srcdir/${_gitname}" "$srcdir/${_gitname}-build"

  msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/${_gitname}-build"

  sed -i -re "s/python?/python2/" src/*.py
  #
  # locale
  #
  for pofile in po/*.po; do 
    lang=`basename $pofile .po`
    dest="$pkgdir/usr/share/${_gitname}/locale/$lang/LC_MESSAGES"
    mkdir -p $dest
    msgfmt -o $dest/deepin-screenshot.mo $pofile
  done

  #
  # install
  #
  
  #Create directories
  install -d $pkgdir/usr/share/${_gitname}
  # src
  cp -r src $pkgdir/usr/share/${_gitname}
  # theme
  cp -r theme $pkgdir/usr/share/${_gitname}
  
  install -Dm644 AUTHORS "$pkgdir/usr/share/${_gitname}"
  install -Dm644 ChangeLog "$pkgdir/usr/share/${_gitname}"
  install -Dm644 README "$pkgdir/usr/share/${_gitname}"
}

# vim:set ts=2 sw=2 et:
