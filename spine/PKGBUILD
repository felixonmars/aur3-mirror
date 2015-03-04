# contributor: raph <galaktor(at)gmx.de>
pkgname=spine
## technically not limited to other versions, but
## at the time of writing the version was 2.1.13
## spine editor is frequently auto-updated via
## a built-in update feature. you might have to
## configure a proxy; check spine documentation.
pkgver=2.1
pkgrel=3
pkgdesc="Spine is an animation tool that focuses specifically on 2D animation for games"
url="http://www.esotericsoftware.com"
license=("Other")
install="spine.install"
depends=("xorg-server")
arch=("i686" "x86_64")

####################
#### 'spinetar' ####
##
## Full path to the spine tarball you are installing.
## Trial tarball is available on the esotericsoftware website.
## examples, depending on the version and arch you have:
##
## Full version (i386)
##   spinetar=Spine-32bit.tar.gz
## Full version (x86_64)
##   spinetar=Spine-64bit.tar.gz
## Trial version (i686)
##   spinetar=SpineTrial-32bit.tar.gz
## Trial version (x86_64)
##   spinetar=SpineTrial-64bit.tar.gz
##
## Note: this is not listed in "source" array since
## we need to copy it first; makepkg would fail
## before we can copy it.
##
## example: an imaginary tarball of the x64 trial
## version residing in raph's "downloads" folder.
##   spinetar=/home/raph/downloads/SpineTrial-64bit.tar.gz
spinetar=

source=("spine.desktop"
        "spine-icon.png")
md5sums=("7e4bcecabd27867af73d586d718d2269"  # spine.desktop
         "cd6ad3fde0676bc33faa0e178c18d3c5") # spine-icon.png

check() {
  ## make sure 'spinetar' is set
  if [ -z "$spinetar" ]; then
    echo "ERROR: 'spinetar' variable not set. edit PKGBUILD then try again."
    exit -1
  else
    echo "INFO: 'spinetar' set to $spinetar"
  fi
}

package() {
  echo "INFO: unpacking archive: $spinetar"
  install -d "$pkgdir/usr/bin/spine"
  bsdtar -zxvf "$spinetar" -C "$pkgdir/usr/bin/spine" --strip-components 1

  ## provide launch script for more convenient executable name
  echo "INFO: creating launcher script in /usr/bin"
  cd $pkgdir/usr/bin
  if [ -f spine/Spine.sh ]; then
    echo "INFO: creating: /usr/bin/spine2d"
    echo "#!/bin/bash"        > $pkgdir/usr/bin/spine2d
    echo "cd /usr/bin/spine" >> $pkgdir/usr/bin/spine2d
    echo "./Spine.sh"        >> $pkgdir/usr/bin/spine2d
    chmod +x $pkgdir/usr/bin/spine2d
  elif [ -f spine/SpineTrial.sh ]; then
    echo "INFO: creating: /usr/bin/spine2d-trial"
    echo "#!/bin/bash"        > $pkgdir/usr/bin/spine2d-trial
    echo "cd /usr/bin/spine" >> $pkgdir/usr/bin/spine2d-trial
    echo "./SpineTrial.sh"   >> $pkgdir/usr/bin/spine2d-trial
    chmod +x $pkgdir/usr/bin/spine2d-trial
  else
    echo "WARN: no matching launch script found in /usr/bin/spine. no launch script created."
  fi

  echo "INFO: installing desktop file"
  install -d -m755 $pkgdir/usr/share/applications
  cp "$srcdir/spine.desktop" "$pkgdir/usr/share/applications"

  echo "INFO: installing spine icon" 
  cp "$srcdir/spine-icon.png" "$pkgdir/usr/bin/spine"
}
