# Maintainer: Benedikt Müller <linopolus@xssn.at>
# Contributor: Benedikt Müller <linopolus@xssn.at>
pkgname=datasoul-git
pkgver=20091231
pkgrel=1
pkgdesc="An open source presentation software to display lyrics and text in churches services."
arch=('any')
url="http://datasoul.net"
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant' 'git')
conflicts=('datasoul')
provides=('datasoul')

_gitroot='git://datasoul.git.sourceforge.net/gitroot/datasoul/datasoul'
_gitname='datasoul/datasoul-v1'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  source /etc/profile.d/apache-ant.sh # just because ant is in /usr/share/apache-ant/ant
  ant jar || return 1
  mkdir -p $pkgdir/usr/{bin,share/{datasoul,pixmaps,applications},lib/datasoul}
  cp dist/* $pkgdir/usr/lib/datasoul/
  cat > $pkgdir/usr/bin/datasoul << EOF
#!/bin/sh
java -Xmx512m -jar /usr/lib/datasoul/datasoul.jar
EOF
  chmod +x $pkgdir/usr/bin/datasoul
  cp packaging/debian/datasoul/usr/share/pixmaps/datasoul.png $pkgdir/usr/share/pixmaps/
  cp packaging/debian/datasoul/usr/share/applications/datasoul.desktop $pkgdir/usr/share/applications/
} 
