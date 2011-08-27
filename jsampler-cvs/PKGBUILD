# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: svoufff <svoufff at gmail dot com>
pkgname=jsampler-cvs
pkgver=20090722
pkgrel=1
pkgdesc="A java frontend to LinuxSampler."
arch=('i686' 'x86_64')
options=('')
url="http://www.linuxsampler.org/"
license=('GPL')
depends=('java-runtime' 'linuxsampler')
makedepends=('cvs' 'java-environment' 'apache-ant' 'jlscp-cvs')
conflicts=('jsampler')
provides=('jsampler')
source=('http://downloads.sourceforge.net/juife/juife-0.4a.tar.bz2'
	'https://swingx.dev.java.net/files/documents/2981/135863/swingx-1.0.zip'
	'https://substance.dev.java.net/files/documents/3294/127141/substance.jar'
	'jsampler.sh'
	'jsampler-classic.sh'
	'jsampler.desktop'
	'jsampler-classic.desktop')
noextract=('substance.jar')
md5sums=('e8c186d9434b7257ef17df36a502da04'
         '166773cd821bbb0ba62fd13c0c2f0556'
         '469983c8c68455e2cb1f6b630aa6c6e2'
         'd2a2774d8e86bfef3e2dd1d0cd641db2'
         'f8b7a4c35c9e1b32d8510a126b53e38a'
         '65500cc73f7cbbd187eab3eb19f86bd0'
         'ec884e5b6f4210ffff331beeeb4be531')
_cvsroot=":pserver:anonymous@cvs.linuxsampler.org:/var/cvs/linuxsampler"
_cvsmod="jsampler"

build() {
  cd $srcdir/

  msg "Connecting to cvs.linuxsampler.org"

  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs update -d -P
  else
    cvs -z3 -d$_cvsroot co $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting ant..."

  cp -r ../$_cvsmod ../$_cvsmod-build
  cd $srcdir/$_cvsmod-build

  # Copy java libs needed for build
  mkdir -p lib/required
  cp /usr/share/java/jlscp/jlscp.jar lib/required/jlscp.jar
  cp $srcdir/juife-0.4a/lib/juife.jar lib/required/juife.jar
  cp $srcdir/swingx-1.0/dist/swingx-1.0.jar lib/required/swingx.jar
  cp $srcdir/substance.jar lib/required/substance.jar

  # Build jsampler interfaces
  . /etc/profile
  ant build-fantasia
  ant build-jsclassic

  # install java files
  install -Dm0644 dist/JS_Classic-*.jar "$pkgdir/usr/share/java/jsampler/js-classic.jar" || return 1
  install -Dm0644 dist/Fantasia-*.jar "$pkgdir/usr/share/java/jsampler/fantasia.jar" || return 1

  # install shell scripts
  install -Dm0755 ../jsampler.sh "$pkgdir/usr/bin/jsampler" || return 1
  install -Dm0755 ../jsampler-classic.sh "$pkgdir/usr/bin/jsampler-classic" || return 1

  # install freedesktop.org compatibility
  install -Dm0644 res/fantasia/icons/app_icon.png "$pkgdir/usr/share/pixmaps/jsampler.png" || return 1
  install -Dm0644 res/js-classic/icons/app-icon.png "$pkgdir/usr/share/pixmaps/jsampler-classic.png" || return 1

  install -Dm0644 ../jsampler.desktop "$pkgdir/usr/share/applications/jsampler.desktop" || return 1
  install -Dm0644 ../jsampler-classic.desktop "$pkgdir/usr/share/applications/jsampler-classic.desktop" || return 1

  rm -rf $srcdir/$_cvsmod-build
}
