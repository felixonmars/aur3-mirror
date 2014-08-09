# Maintainer: Alexandre DeZotti <Dezotti Alexandre at gmail>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgname=skype-restricted
_pkgname=skype
pkgver=4.3.0.37
pkgrel=2
pkgdesc="Skype packaged to run as a dedicated user for security reasons"
arch=(i686 x86_64)
url="http://www.skype.com/"
license=('custom')
depends=(gksu)
conflicts=('skype-staticqt' 'skype')
options=('!strip')
install=skype.install
changelog=ChangeLog
source=(http://download.skype.com/linux/$_pkgname-$pkgver.tar.bz2
        ftp://ftp.archlinux.org/other/$_pkgname/qtwebkit-2.2.2-i686.tar.xz
        skype-restricted skype-wrapper skype-control)


if [[ $CARCH == i686 ]]; then
  depends+=(qt4 libxss libxcursor v4l-utils gstreamer0.10-base)
  optdepends=('libcanberra: XDG sound support'
              'pulseaudio: PulseAudio support')
  provides=('skype')
  else
  depends+=(lib32-{qt4,libxss,libxcursor,v4l-utils})
  optdepends=('lib32-libcanberra: XDG sound support'
              'lib32-libpulse: PulseAudio support')
  conflicts+=(bin32-skype bin32-skype-staticqt)
  provides=("bin32-skype=$pkgver" "skype")
  replaces=(bin32-skype)
fi


prepare () {
    if [[ `getent group | grep -c '^_skype'` -eq 0 ]]; then
	sudo groupadd -r _skype
    else
	echo "Warning: the _skype group already exists, if not from previous installations of ${pkgname}, you should check wether it is a system group."
    fi

    if [[ `getent passwd | grep -c '^_skype:'` -eq 0 ]] ; then
    	sudo useradd -g _skype -G audio,video -c "Skype-only user account" -d /var/skype -m -r -s /bin/nologin _skype
    else
	echo "Warning: the _skype user already exists, if not from previous installations of ${pkgname}, you may want to remove it and force re-install the package."
    fi
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  if [[ $CARCH == i686 ]]; then
      libdir="usr/lib" 
      # FS#33417 - Skype wants qtwebkit 2.2.x
      install -Dm755 "${srcdir}"/libQtWebKit.so.4 "${pkgdir}"/usr/share/skype/lib/libQtWebKit.so.4
  else
      libdir="usr/lib32"
  fi

  install -d "$pkgdir/usr/bin"
  sed "s#@LIBDIR@#/$libdir#" "$srcdir/skype-restricted" > "$pkgdir/usr/bin/skype"
  chmod 755 "$pkgdir/usr/bin/skype"
  install -m 755 "$srcdir/skype-control" "$pkgdir/usr/bin/skype-control"
  #chmod -s "$pkgdir/usr/bin/skype-control"

  install -Dm 544 "$srcdir/skype-wrapper" "$pkgdir/var/skype/skype"
  chown _skype:_skype "$pkgdir/var/skype/skype"

  chmod 755 "$pkgdir/var/skype"


  # Executable
  install -D skype "$pkgdir/$libdir/skype/skype"

  # Data
  mkdir -p "$pkgdir"/usr/share/skype/{avatars,lang,sounds}
  install -m 644 avatars/* "$pkgdir/usr/share/skype/avatars"
  install -m 644 lang/*    "$pkgdir/usr/share/skype/lang"
  install -m 644 sounds/*  "$pkgdir/usr/share/skype/sounds"

  # DBus Service
  install -Dm 644 skype.conf \
    "$pkgdir/etc/dbus-1/system.d/skype.conf"

  # Icons
  for _i in 16 24 32 48 64 96 128 256; do
    install -Dm 644 icons/SkypeBlue_${_i}x${_i}.png \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/skype.png"
  done
  install -Dm 644 icons/SkypeBlue_48x48.png \
    "$pkgdir/usr/share/pixmaps/skype.png"

  # Desktop file
  install -Dm 644 skype.desktop \
    "$pkgdir/usr/share/applications/skype.desktop"

  # License
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('95db8f2072b9acd6f79ed42da3d6db79'
         '42c01ffa98e32b59605403efb42c8821'
         '6cfeeab209176017c7c3aaec10d9a4ec'
         '1c5e32f50c4f291c09fc96ff5e745a21'
         '30ebcbc59b1ae7ad15c719a42d29bf7b')
