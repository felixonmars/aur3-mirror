# Contributor: Dan Serban

pkgname=datavisualizationapp
pkgver=0.9.2
pkgrel=1
pkgdesc="A free, generic, cross-platform and cross-DB reporting tool"
arch=(any)
url=http://sites.google.com/site/datavisualizationapplication/
license=('custom:freeware:EULA')
depends=('java-runtime')

build()
{
  wget -O DataVisualization0.9.2.zip "http://sites.google.com/site/datavisualizationapplication/file-cabinet/DataVisualization0.9.2.zip?attredirects=0"
  bsdtar -xvf DataVisualization0.9.2.zip
  mkdir -p $pkgdir/usr/share
  mv "Data Visualization 0.9.2" datavisualizationapp
  mv datavisualizationapp $pkgdir/usr/share/
  rm $pkgdir/usr/share/datavisualizationapp/run.bat
  mkdir -p $pkgdir/usr/bin
  echo "#!/bin/bash" > $pkgdir/usr/bin/datavisualizationapp
  echo "cd /usr/share/datavisualizationapp" >> $pkgdir/usr/bin/datavisualizationapp
  echo "./run.sh" >> $pkgdir/usr/bin/datavisualizationapp
  chmod +x $pkgdir/usr/bin/datavisualizationapp
}
