# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: August Gustavsson <august.g |at| telia.com>
# Contributor: Travis Nickles <ryoohki7 |at| yahoo.com>
# Contributor: Joonas Niilola <juippis |at| roskakori.org>

pkgname=stepmania-beta
pkgver=4.0b7
pkgrel=3
pkgdesc='An advanced dance simulation game'
arch=('i686' 'x86_64')
url="http://www.stepmania.com/"
license=('MIT')
depends=('ffmpeg' 'gtk2' 'libmad' 'lua' 'mesa' 'libxtst')
install=stepmania-beta.install
source=(gcc41.patch
	lua51-2.patch
	sdl.patch
	warnings-4.patch
	gcc-4.3.patch
        ffmpeg-pixfmt.patch
        libpng14.patch
	stat.patch
	$pkgname.desktop
	$pkgname.sh
	$pkgname.xpm)
md5sums=('fee3b268bf28a22c57d44bd02aec88e1'
         'e112302cc41d6f1cd5c668989daf4222'
         '57f24c097fbd478bf4174a4351d32150'
         '3d38e8527b576220547a1f66757107be'
         '796230dbd6dabec993c580895fdf35c8'
         '54d15727565602e9d20629fb5082f4b5'
         'aa5f294166f5d3c35326e18f37251f2c'
         '9385a40b06ce3aa903114b83a26c0681'
         'a9e8e500781684850db2278417fd2ca0'
         'ccbdfa06ecfa5554f603cfe318b7bada'
         '10732965e8abf53ba4b85c63377daf2e')

svntrunk="https://svn.stepmania.com/svn/branches/4.0/stepmania"
svnmod="stepmania"
svnrev=28500

build() {
  cd "$srcdir"

  if [ -d $svnmod/.svn ]; then
    (cd $svnmod && svn up -r $svnrev)
  else
    svn co $svntrunk --config-dir ./ -r $svnrev $svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $svnmod-build
  cp -r $svnmod{,-build}
  cd $svnmod-build

  # Apply patches so StepMania will compile with newer versions of ffmpeg,
  # newer versions of gcc, newer glibc packages, lua 5.1, and newer 
  # versions of sdl.
  patch -Np1 -i ../gcc41.patch || return 1
  patch -Np1 -i ../lua51-2.patch || return 1
  patch -Np1 -i ../sdl.patch || return 1
  patch -Np1 -i ../warnings-4.patch || return 1
  patch -Np1 -i ../gcc-4.3.patch || return 1
  patch -Np1 -i ../ffmpeg-pixfmt.patch || return 1
  patch -Np1 -i ../libpng14.patch || return 1
  patch -Np0 -i ../stat.patch || return 1

  #automake and autoconf files have been modified
  aclocal -I autoconf/m4
  autoconf
  autoheader
  touch autoconf/config.rpath
  automake -a

  # Build the StepMania source code
  LDFLAGS="$LDFLAGS -Wl,--as-needed" ./configure --enable-force-oss
  make || return 1
}

package() {
  cd "$srcdir/$svnmod-build"

  # Copy game data to destination
  make bindir=/opt/$pkgname DESTDIR="$pkgdir" install

  cp -r Announcers BGAnimations BackgroundEffects BackgroundTransitions CDTitles \
	  Characters Courses Data NoteSkins Packages RandomMovies Songs Themes \
	  "$pkgdir/opt/$pkgname/"
  cd $pkgdir/opt/$pkgname
  find $pkgdir/opt/$pkgname -type d -name ".svn" -exec rm -rf '{}' +
  install -d Logs Save Cache{,/Banners,/Songs} \
	  Data/{LocalProfiles,MachineProfile{,/Edits,/Screenshots}}

  # Change file permissions so that users in the games group can write save data,
  # write to log files, and add more content
  chown -R root:games .
  chmod -R g+w .
  chmod 755 stepmania GtkModule.so
  find -type d -exec chmod g+s '{}' +

  # Install bash script, desktop entry files, and license info
  install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/$pkgname.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
  install -D -m644 $srcdir/$svnmod-build/Docs/Licenses.txt $pkgdir/usr/share/licenses/$pkgname/Copying.txt
}
