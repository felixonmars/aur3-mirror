# Contributor: Patrick Schneider <patrick.schneider@uni-ulm.de>
pkgname=jgrousedoc
pkgver=2.0
pkgrel=1
pkgdesc="JavaScript Documentation Tool"
arch=('i686' 'x86_64')
url="http://code.google.com/p/jgrousedoc/"
license=('BSD')
depends=('jre' 'apache-ant>=1.7')
source=(http://jgrousedoc.googlecode.com/files/jGrouseDoc-$pkgver.zip)

build() {
  cd "$srcdir/jGrouseDoc-$pkgver"
  target="$pkgdir/opt/jgrousedoc"

  # Remove executeable flag
  find . -type f -exec chmod -x {} +

  # Set jGrouseHome path
  patch -N -p0 <<EOF
--- jgrousedoc.properties	2008-03-31 21:19:22.000000000 +0200
+++ jgrousedoc.properties	2009-06-19 09:00:49.000000000 +0200
@@ -1,3 +1,3 @@
 #set jGrouseHome - location of jGrouseDoc distribution
-jGrouseHome.default=.
+jGrouseHome.default=/opt/jgrousedoc
 #set the location of your source files
@@ -10,2 +10,2 @@
 ########### for additional information regarding configuration parameters
-########### see http://code.google.com/p/jgrousedoc/wiki/AdvancedConfiguration
\ No newline at end of file
+########### see http://code.google.com/p/jgrousedoc/wiki/AdvancedConfiguration
EOF
  
  # Copy files
  mkdir -p "$target"
  cp -R * "$target"
}

# vim:set ts=2 sw=2 et:
