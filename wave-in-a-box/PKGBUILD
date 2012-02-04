# Contributor: Tim Besard <tim.besard@gmail.com>

pkgname=wave-in-a-box
pkgver=1.0
pkgrel=1
pkgdesc="A software framework centered on online real-time collaborative editing."
arch=('i686' 'x86_64')
license=('GPL')
url=('https://wave.google.com/wave/')
depends=('mongodb' 'jdk')
makedepends=('mercurial' 'apache-ant')
source=('wave-in-a-box')
noextract=()
md5sums=('e135909101a1c3ecf84a1f6025807d79')

merc_root='https://wave-protocol.googlecode.com/hg/'
merc_repo='wave-protocol'

build() {
  msg "Connecting to Mercurial server...."

  if [ -d $merc_repo ] ; then
    cd $merc_repo
    hg pull -u
    msg "The local files are updated."
  else
    msg "hg clone $merc_root $merc_repo" 
    hg clone $merc_root $merc_repo
  fi

  msg "Mercurial checkout done or server timeout"
  
  msg "Starting make..."
  rm -rf "$srcdir/$merc_repo-build"
  cp -r "$srcdir/$merc_repo" "$srcdir/$merc_repo-build"
  cd "$srcdir/$merc_repo-build"
  /usr/share/java/apache-ant/bin/ant
}

package() {
  cd "$srcdir/$merc_repo-build"
  msg "Starting build"
  
  mkdir -p "$pkgdir/usr/share/"
  cp "$srcdir/$merc_repo-build/dist" "$pkgdir/usr/share/wave-in-a-box" -R
  cp "$srcdir/$merc_repo-build/process-script-args.sh" "$pkgdir/usr/share/wave-in-a-box/"
  cp "$srcdir/$merc_repo-build/build.properties" "$pkgdir/usr/share/wave-in-a-box/"
  
  mkdir -p "$pkgdir/etc/wave-in-a-box/"
  cp "$srcdir/$merc_repo-build/server.config.example" "$pkgdir/etc/wave-in-a-box/"
  
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/../$pkgname" "$pkgdir/usr/bin/$pkgname"
  chmod a+x "$pkgdir/usr/bin/$pkgname"
} 

