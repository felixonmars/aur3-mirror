# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>
pkgname=dejasmin
pkgver=0.4
pkgrel=1
pkgdesc="Disassembler for the Java Virtual Machine"
url="http://tinapoc.sourceforge.net/"
license=('GPL')
depends=('jre')
makedepends=('apache-ant' 'java-environment')
arch=('i686' 'x86_64')

# Use specific sourceforge mirror in case of any problems
source=(\
  http://heanet.dl.sourceforge.net/sourceforge/tinapoc/tinapoc-0.4-alpha.zip \
  dejasmin-0.4.patch \
  dejasmin \
  dejasmin.mf
)

build()
{
  # Patch sources
  cd $startdir/src/src || return 1
  patch -p1 < ../dejasmin-0.4.patch || return 1

  # Compile sources
  install -d $startdir/src/build || return 1
  echo "Compiling sources..."
  javac -cp "$startdir/src/bin/bcel-5.1.jar:." -d "$startdir/src/build" dejasmin.java || return 1

  # Make jar 
  cd $startdir/src/build || return 1
  jar -cfme "$startdir/src/dejasmin.jar" "$startdir/src/dejasmin.mf" dejasmin * || return 1

  # Install jar
  install -D -m644 $startdir/src/dejasmin.jar $startdir/pkg/usr/share/java/dejasmin/dejasmin.jar || return 1
  
  # Install dependencies
  install -D -m644 $startdir/src/bin/bcel-5.1.jar $startdir/pkg/usr/share/java/dejasmin/bcel-5.1.jar || return 1

  # Install startup script
  install -D -m755 $startdir/src/dejasmin $startdir/pkg/usr/bin/dejasmin || return 1
}

md5sums=('cd523f00243ca17631b4fc7f4c53b249'
         '535042f97e04111c89d79921599a6b79'
         'db8263c2166abe6fcae0f47246a162e9'
         '3b957e5d76c2f1edd3ca29953d5bb70a')
