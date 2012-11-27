post_install() {
  cat <<- EOF
    ==> if you launch sbt without -sbt-launch-dir option, 
    ==> it defaults to \${script_dir}/.lib.
    ==> thus sbt tries to create /usr/bin/.lib and failes.
    ==> so you need to launch sbt with suitable -sbt-launch-dir option.
    ==> this is probably better to be fixed in the future?
EOF
}

post_upgrade() {
  post_install $0
}
