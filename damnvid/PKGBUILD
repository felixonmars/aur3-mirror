# Maintainer: Austin <doorknob60 at gmail dot com>

pkgname=damnvid
pkgver=1.6
pkgrel=11
pkgdesc="An application to download and convert videos from your hard drive or from dozens of video sharing websites like YouTube, Dailymotion, Veoh, Metacafe, etc."
arch=(any)
url="http://code.google.com/p/damnvid/"
license=(GPL)
depends=('python2' 'wxpython>=2.8.10' 'python2-gdata' 'python2-beautifulsoup3' 'ffmpeg' 'socksipy')
source=('http://damnvid.googlecode.com/files/damnvid-1.6-source.tar.bz2' 'http://damnvid.googlecode.com/svn/trunk/build-any/build-required-files.py')
md5sums=('127e8b02e0321e03a838814ebe87e95b' '3a14e7f992974588df0aa3f5613790ac')

build() {
install -d $pkgdir/usr/bin
install -d $pkgdir/usr/share/applications
install -d $pkgdir/usr/share/damnvid
wget http://damnvid.googlecode.com/svn/trunk/build-deb/damnvid -O $srcdir/damnvid/build-deb/damnvid
sed -i 's/python/python2/' $srcdir/damnvid/build-deb/damnvid
sed -i 's/.py/.pyo/' $srcdir/damnvid/build-deb/damnvid
cp $srcdir/build-required-files.py $srcdir/damnvid/build-any/
cd $srcdir/damnvid
python2 -OO build-any/build-required-files.py
sed -i 's/version.d/version.damnvid/' required-files.txt
for files in `cat required-files.txt | grep -v ' '`
do
cp --parents "$files" "$pkgdir/usr/share/damnvid/"
done
IFS=$'\n'
for files in `cat required-files.txt | grep ' '`
do
cp "`echo "$files" | cut -d' ' -f1`" "$pkgdir`echo "$files" | cut -d' ' -f2`"
done
}
