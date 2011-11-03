# Maintainer: Christophe Calvès <calves@crans.com>
pkgname=xsbt-git
pkgver=20111103
pkgrel=1
pkgdesc="sbt 0.11.x series"
arch=(any)
url="https://github.com/harrah/xsbt"
license=('BSD')
groups=()
depends=('java-runtime' 'scala')
makedepends=('') # proguard 4.7 beta 2 is downloaded and compiled by the script
#makedepends=('proguard>4.6') # works fine with progard 4.7 beta 2

provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('http://typesafe.artifactoryonline.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/0.11.0/sbt-launch.jar'
        'http://downloads.sourceforge.net/project/proguard/proguard%20beta/4.7beta/proguard4.7beta2.tar.gz'
        sbt
        sbt_to_install
        LICENSE
       )
noextract=('sbt-launch.jar')
md5sums=('fa57b75cbc45763b7188a71928f4cd9a'
         '74ba52b98662abd8db7f0d313e4405bb'
         '86fcf72d73cc9393e1472172364c157e'
         '1b09b6567cddd38c8d37c86da6215335'
         '0cc49331142988765ce73782a5839c57')

_gitroot="git://github.com/harrah/xsbt.git"
_gitname="xsbt"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  
  cd "$srcdir/$_gitname"

  #
  # BUILD HERE
  #
 
  # Perform most of the tasks but not proguard
  # as the proguard version provided by ivy2 is 4.4
  # which does not handle Java 7 classes (version 51)
  sh "$startdir/sbt" publish-local

  # Now that push-local has set ivy2, we can trick its
  # cache to provide the proguard version installed on
  # the system

  # Proguard community package is version 4.6
  # We need 4.7 beta with java 7
  # So let's build proguard 4.7 beta 2
  msg "Building proguard.jar"
  PROGUARDDIR=$( cd "$srcdir"
                 find . -maxdepth 1 -type d -name "proguard*" | \
                 sed "s|./||" )
  ( cd "$srcdir/$PROGUARDDIR/build"
    /bin/rm -fv "$srcdir/$PROGUARDDIR/lib"/*
    ./build.sh
  )
  PROGUARDJAR="$srcdir/$PROGUARDDIR/lib/proguard.jar"
  PROGUARDVERSION=$( java -jar "$PROGUARDJAR" | \
                     grep -o "version .*"     | \
                     sed "s/version //;s/[ \t\r]//g" )


  # When community package is 4.7, this will work
#   PROGUARDJAR=$( pacman -Ql proguard                 | \
#                  grep -E "proguard(|[0-9_\-].*).jar" |
#                  cut -d " " -f 2 )

  msg "Proguard Version = $PROGUARDVERSION"
  msg "Tricking ivy2 cache (in $HOME/.ivy2/cache)"
  ( cd "$HOME/.ivy2/cache/"
    tar -xvf "$startdir/ivy2cachefake.tar.bz2"
    cd net.sf.proguard/proguard/

    for i in `ls *REPLACEBYPROGUADRDVERSION*`
    do j=$(echo "$i" | sed "s/REPLACEBYPROGUADRDVERSION/$PROGUARDVERSION/g")
       sed -i "s/REPLACEBYPROGUADRDVERSION/$PROGUARDVERSION/g" "$i"
       mv -v "$i" "$j"
    done

    cp -v "$PROGUARDJAR" "jars/proguard-$PROGUARDVERSION.jar"
  )
  
  # Patching Project.scala
  ( cd project
    sed -i "s/\"proguard\" \+% \+\"[^\"]*\"/\"proguard\" % \"$PROGUARDVERSION\"/g" Proguard.scala
    # scala/package$ seems to be required
    sed -i "s/,\!scala.package\\$//g" Proguard.scala
  )

  # Patching done, launch!
  msg "sbt proguard"
  sh "$startdir/sbt" proguard

  # SXR
  msg "sbt sxr"
  sh "$startdir/sbt" sxr

  # doc
  msg "sbt doc"
  sh "$startdir/sbt" doc
}

package() {
  cd "$srcdir/$_gitname"
  
  install -v -D -m0755    "$startdir/sbt_to_install" "$pkgdir/usr/bin/sbt"
  install -v -D -m0555    target/sbt-launch-*.jar    "$pkgdir/usr/share/java/sbt-launch.jar"
  install -v -D -m0555    "$startdir/LICENSE"        "$pkgdir/usr/share/licenses/xsbt/LICENSE"

  mkdir -p "$pkgdir/usr/share/doc/"
  cp -rv  "target/browse.sxr" "$pkgdir/usr/share/doc/xsbt"
}

# vim:set ts=2 sw=2 et:
