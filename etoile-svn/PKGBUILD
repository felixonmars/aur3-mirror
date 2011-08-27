# Contributor: Sebastian Nowicki <sebnow@gmail.com>
pkgname=etoile-svn
pkgver=4563
pkgrel=1
pkgdesc="A GNUstep based user environment"
arch=('i686' 'x86_64')
url="http://etoileos.com"
license=('GPL')
install="etoile.install"
depends=('gmp' 'dbus-core' 'postgresql-libs' 'oniguruma' 'ffmpeg'
         'lemon' 'poppler' 'libxss' 'taglib' 'libmp4v2'
         'libxcursor' 'startup-notification' 'hal' 'gnustep-gui'
         'gnustep-back' 'scrnsaverproto')
makedepends=('llvm')
source=('http://download.gna.org/etoile/etoile-default-fonts.tar.gz'
        'MKMediaFile.h.patch')
md5sums=('ed4eba95d54db6edd99700104559b765'
         '2d42f23fd08523231fd18ec134e0cb93')

_svntrunk=svn://svn.gna.org/svn/etoile/trunk/Etoile
_svnmod=Etoile

build() {
  # Setup GNUstep environment
  if [ -f /opt/GNUstep/System/Library/Makefiles/GNUstep.sh ]; then
    source /opt/GNUstep/System/Library/Makefiles/GNUstep-reset.sh
    source /opt/GNUstep/System/Library/Makefiles/GNUstep.sh
  fi

  local _gsroot="$pkgdir${GNUSTEP_SYSTEM_ROOT}"

  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    msg "Updating files..."
    (cd $_svnmod && svn up -r $pkgver)
  else
    msg "Checking out files..."
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "Building..."

  # Remove the build dir before copying the updated version. If it's not
  # removed, the updated checkout will be copied inside the old build
  # directory, rather than replace it.
  rm -rf "$srcdir/${_svnmod}-build"
  cp -R "$srcdir/$_svnmod" "$srcdir/${_svnmod}-build"

  cd "$srcdir/${_svnmod}-build"

  patch -Np1 -i "$srcdir/MKMediaFile.h.patch"

  make all || return 1
  make DESTDIR="$pkgdir" install || return 1

  install -Dm644 Services/Private/System/etoile.desktop \
    "$pkgdir/usr/share/xsessions/etoile.desktop"
  # Fix the executable path (/usr/local/bin -> /usr/bin)
  sed -i '/^Exec/ s#local/##' "$pkgdir/usr/share/xsessions/etoile.desktop"
  install -Dm644 Services/Private/System/SystemTaskList.plist \
    "${_gsroot}/Library/Etoile/SystemTaskList.plist"
  # Install Nesedah themes
  # TODO: Should this be a separate package?
  cp -R Themes "$_gsroot/"
  rm -rf "${_gsroot}/Themes/.svn/"
  # Install fonts
  mkdir -p "${_gsroot}/Fonts/"
  ls "$srcdir/etoile-default-fonts/" | while read dir; do
    cp -R "$srcdir/etoile-default-fonts/$dir" "${_gsroot}/Fonts/"
  done

  # Generate a similar etoile executable to the one ./setup.sh generates. The
  # GNUstep.sh script is executed on login, so we do not need to source it,
  # like the ./setup.sh generated script does.
  mkdir -p "$pkgdir/usr/bin/"
  echo -e "#/bin/sh\netoile_system" > "$pkgdir/usr/bin/etoile"
  chmod 755 "$pkgdir/usr/bin/etoile"

  # Remove weird semi-recursive symlinks. Why does this happen?
  cd "$pkgdir${GNUSTEP_LOCAL_ROOT}/Library/Frameworks"
  for i in *; do rm -f $i/$i; done
  rm -f "$_gsroot/Library/Frameworks/XWindowServerKit.framework/XWindowServerKit.framework"

  # Fix symlinks
  cd "$pkgdir${GNUSTEP_LOCAL_ROOT}/Library/Headers"
  rm -f AddressBook
  ln -s Addresses AddressBook

  # Copy documentation instead of symlinking to source
  cd "$pkgdir${GNUSTEP_LOCAL_ROOT}/Library/Documentation"
  for i in EtoileThread EtoileXML; do
    rm -f $i
    cp -R "$srcdir/${_svnmod}/Frameworks/EtoileFoundation/$i" .
  done
}

# vim:set ts=2 sw=2 et:

