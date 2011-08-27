# Contributor: Patrick Schneider <Patrick.Schneider@uni-ulm.de>
pkgname=darwin-streaming-server
pkgver=6.0.3
pkgrel=4
pkgdesc="Open source version of Apple's QuickTime Streaming Server technology"
arch=('i686' 'x86_64')
url="http://dss.macosforge.org/"
license=('custom:APSL')
depends=('perl>=5.2')
backup=(etc/streaming/streamingserver.xml
  etc/streaming/streamingadminserver.conf
  etc/streaming/streamingadminserver.pem
  etc/streaming/qtusers
  etc/streaming/qtgroups
  etc/streaming/streamingloadtool.conf
  etc/streaming/relayconfig.xml)
source=(http://dss.macosforge.org/downloads/DarwinStreamingSrvr$pkgver-Source.tar
  dss-$pkgver.patch
  dss-hh-20080728-1.patch
  $pkgname.install
  dss.rc
  dss-admin.rc)
md5sums=('ca676691db8417d05121699c0ca3d549'
         'd0ed051ff7ec4de57d3787295ed38d28'
         '4a55c16f291f60056f38ee687680c769'
         '879235c13695f2a17112ae066d33e7fe'
         '4926ad6d1c6b2a1c55059d735ed9962b'
         '113e706f69f1f767a738bda0aa64b2b6')
install=$pkgname.install

build() {
  cd "$srcdir/DarwinStreamingSrvr$pkgver-Source"

  patch -p1 < ../dss-$pkgver.patch
  patch -p1 < ../dss-hh-20080728-1.patch

  ./Buildit || return 1

  install -D -m 644 APPLE_LICENSE "$pkgdir/usr/share/licenses/$pkgname/APPLE_LICENSE"

  install -D DarwinStreamingServer "$pkgdir/usr/sbin/DarwinStreamingServer"
  install -D PlaylistBroadcaster.tproj/PlaylistBroadcaster "$pkgdir/usr/bin/PlaylistBroadcaster"
  install MP3Broadcaster/MP3Broadcaster "$pkgdir/usr/bin/MP3Broadcaster"
  install qtpasswd.tproj/qtpasswd "$pkgdir/usr/bin/qtpasswd"
  install StreamingLoadTool/StreamingLoadTool "$pkgdir/usr/bin/StreamingLoadTool"
  install WebAdmin/src/streamingadminserver.pl "$pkgdir/usr/sbin/streamingadminserver.pl"

  install -D "$srcdir/dss.rc" "$pkgdir/etc/rc.d/dss"
  install "$srcdir/dss-admin.rc" "$pkgdir/etc/rc.d/dss-admin"

  mkdir -p "$pkgdir/usr/sbin/StreamingServerModules"
  install -D -m 600 relayconfig.xml-Sample "$pkgdir/etc/streaming/relayconfig.xml-Sample"
  echo "realm Streaming Server" > "$pkgdir/etc/streaming/qtusers"
  chmod 600 "$pkgdir/etc/streaming/qtusers"
  echo "admin: " > "$pkgdir/etc/streaming/qtgroups"
  chmod 600 "$pkgdir/etc/streaming/qtgroups"
  install -m 644 -D Documentation/readme.txt "$pkgdir/var/streaming/readme.txt"
  install -m 644 Documentation/3rdPartyAcknowledgements.rtf "$pkgdir/var/streaming/3rdPartyAcknowledgements.rtf"
  mkdir -p "$pkgdir/var/streaming/logs"
  mkdir -p -m 775 "$pkgdir/var/streaming/movies"
  mkdir -p -m 770 "$pkgdir/var/streaming/playlists"
  install -m 644 sample_100kbit.mov "$pkgdir/var/streaming/movies/sample_100kbit.mov"
  install -m 644 sample_300kbit.mov "$pkgdir/var/streaming/movies/sample_300kbit.mov"
  install -m 644 sample_100kbit.mp4 "$pkgdir/var/streaming/movies/sample_100kbit.mp4"
  install -m 644 sample_300kbit.mp4 "$pkgdir/var/streaming/movies/sample_300kbit.mp4"
  install -m 644 sample.mp3 "$pkgdir/var/streaming/movies/sample.mp3"
  install -m 644 sample_50kbit.3gp "$pkgdir/var/streaming/movies/sample_50kbit.3gp"
  install -m 644 sample_h264_100kbit.mp4 "$pkgdir/var/streaming/movies/sample_h264_100kbit.mp4"
  install -m 644 sample_h264_300kbit.mp4 "$pkgdir/var/streaming/movies/sample_h264_300kbit.mp4"
  install -m 644 sample_h264_1mbit.mp4 "$pkgdir/var/streaming/movies/sample_h264_1mbit.mp4"
  install -m 644 StreamingLoadTool/streamingloadtool.conf "$pkgdir/etc/streaming/streamingloadtool.conf"
  cp -f -r WebAdmin/WebAdminHtml "$pkgdir/var/streaming"
  mv "$pkgdir/var/streaming/WebAdminHtml" "$pkgdir/var/streaming/AdminHtml"
  install -m 644 WebAdmin/streamingadminserver_Darwin.conf "$pkgdir/etc/streaming/streamingadminserver.conf"
}

# vim:set ts=2 sw=2 et:
